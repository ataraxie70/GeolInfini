BEGIN;


CREATE OR REPLACE FUNCTION publications.ensure_identifier_policy()
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
    allows_fuzzy BOOLEAN;
BEGIN
    SELECT p.allows_fuzzy INTO allows_fuzzy
    FROM publications.identifier_type_policy p
    WHERE p.type_code = NEW.type_code;

    IF allows_fuzzy IS NULL THEN
        RAISE EXCEPTION 'unknown identifier type policy: %', NEW.type_code;
    END IF;

    IF NEW.matching_mode = 'floue_controlee' AND allows_fuzzy = false THEN
        RAISE EXCEPTION 'fuzzy matching is not permitted for identifier type %', NEW.type_code;
    END IF;

    RETURN NEW;
END;
$$;

CREATE CONSTRAINT TRIGGER identifier_definition_policy
AFTER INSERT OR UPDATE OF type_code, matching_mode
ON publications.identifier_definition
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION publications.ensure_identifier_policy();

-- Publication -> model must remain in the same organization.
-- PostgreSQL cannot express this as a simple CHECK; enforce it transactionally
-- in the application service or through a deferred constraint trigger.
CREATE OR REPLACE FUNCTION publications.ensure_publication_model_same_org()
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
    model_org UUID;
BEGIN
    SELECT organization_id INTO model_org
    FROM publications.publication_model
    WHERE id = NEW.model_id;

    IF model_org IS NULL THEN
        RAISE EXCEPTION 'publication_model % does not exist', NEW.model_id;
    END IF;

    IF model_org <> NEW.organization_id THEN
        RAISE EXCEPTION 'publication organization % differs from model organization %',
            NEW.organization_id, model_org;
    END IF;

    RETURN NEW;
END;
$$;

CREATE CONSTRAINT TRIGGER publication_model_same_org
AFTER INSERT OR UPDATE OF organization_id, model_id
ON publications.publication
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION publications.ensure_publication_model_same_org();

-- Active generation pointer must reference a generation belonging to the same publication.
CREATE OR REPLACE FUNCTION consultation.ensure_active_generation_matches_publication()
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
    generation_publication UUID;
BEGIN
    IF NEW.active_generation_id IS NULL THEN
        RETURN NEW;
    END IF;

    SELECT publication_id INTO generation_publication
    FROM consultation.projection_generation
    WHERE id = NEW.active_generation_id;

    IF generation_publication IS NULL THEN
        RAISE EXCEPTION 'projection generation % does not exist', NEW.active_generation_id;
    END IF;

    IF generation_publication <> NEW.publication_id THEN
        RAISE EXCEPTION 'active generation % belongs to publication %, not %',
            NEW.active_generation_id, generation_publication, NEW.publication_id;
    END IF;

    RETURN NEW;
END;
$$;

CREATE CONSTRAINT TRIGGER projection_active_generation_matches_publication
AFTER INSERT OR UPDATE OF active_generation_id, publication_id
ON consultation.publication_projection
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION consultation.ensure_active_generation_matches_publication();

-- A generation marked active must correspond to a projection row that points to it.
CREATE OR REPLACE FUNCTION consultation.ensure_active_generation_pointer()
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
    projection_generation UUID;
BEGIN
    IF NEW.status <> 'active' THEN
        RETURN NEW;
    END IF;

    SELECT active_generation_id INTO projection_generation
    FROM consultation.publication_projection
    WHERE publication_id = NEW.publication_id;

    IF projection_generation <> NEW.id THEN
        RAISE EXCEPTION 'active generation % is not the active pointer of publication %',
            NEW.id, NEW.publication_id;
    END IF;

    RETURN NEW;
END;
$$;

CREATE CONSTRAINT TRIGGER projection_active_generation_pointer
AFTER INSERT OR UPDATE OF status, publication_id
ON consultation.projection_generation
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION consultation.ensure_active_generation_pointer();

-- Derived outbox status helper. The dispatcher/projector calls this after each delivery change.
CREATE OR REPLACE FUNCTION publications.refresh_outbox_event_status(p_event_id UUID)
RETURNS void
LANGUAGE plpgsql
AS $$
DECLARE
    has_dead_letter BOOLEAN;
    all_delivered BOOLEAN;
    has_processing BOOLEAN;
BEGIN
    SELECT
        bool_or(status = 'dead_letter'),
        bool_and(status = 'delivered'),
        bool_or(status = 'processing')
    INTO has_dead_letter, all_delivered, has_processing
    FROM publications.outbox_delivery
    WHERE event_id = p_event_id;

    UPDATE publications.outbox_event
    SET status = CASE
        WHEN COALESCE(has_dead_letter, false) THEN 'dead_letter'
        WHEN COALESCE(all_delivered, false) THEN 'delivered'
        WHEN COALESCE(has_processing, false) THEN 'processing'
        ELSE 'pending'
    END
    WHERE id = p_event_id;
END;
$$;

COMMIT;
