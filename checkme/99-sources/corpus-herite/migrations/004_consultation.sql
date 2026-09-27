BEGIN;

CREATE TABLE consultation.publication_projection (
    publication_id UUID PRIMARY KEY,
    status TEXT NOT NULL DEFAULT 'non_indexee',
    active_generation_id UUID,
    error_code TEXT,
    error_message TEXT,
    indexed_at TIMESTAMPTZ,
    blocked_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT ck_projection_status CHECK (
        status IN ('non_indexee', 'indexation_en_cours', 'indexee', 'indexation_en_erreur', 'desindexation_en_cours')
    ),
    CONSTRAINT ck_projection_error_consistency CHECK (
        (status <> 'indexation_en_erreur' AND error_code IS NULL)
        OR status = 'indexation_en_erreur'
    )
);

CREATE TABLE consultation.projection_generation (
    id UUID PRIMARY KEY,
    publication_id UUID NOT NULL,
    generation_number BIGINT NOT NULL,
    status TEXT NOT NULL DEFAULT 'building',
    expected_count BIGINT,
    indexed_count BIGINT NOT NULL DEFAULT 0,
    checksum TEXT,
    started_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    completed_at TIMESTAMPTZ,
    activated_at TIMESTAMPTZ,
    CONSTRAINT uq_projection_generation_number UNIQUE (publication_id, generation_number),
    CONSTRAINT ck_generation_status CHECK (status IN ('building', 'ready', 'active', 'failed', 'retired')),
    CONSTRAINT ck_generation_counts CHECK (
        indexed_count >= 0
        AND (expected_count IS NULL OR expected_count >= 0)
    )
);

CREATE UNIQUE INDEX uq_projection_one_active_generation
    ON consultation.projection_generation(publication_id)
    WHERE status = 'active';

CREATE TABLE consultation.projection_record (
    id UUID PRIMARY KEY,
    publication_id UUID NOT NULL,
    generation_id UUID NOT NULL REFERENCES consultation.projection_generation(id) ON DELETE CASCADE,
    source_record_id UUID NOT NULL,
    source_aggregate_version BIGINT NOT NULL,
    display_payload JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT uq_projection_record_generation_source UNIQUE (generation_id, source_record_id),
    CONSTRAINT ck_projection_record_version_positive CHECK (source_aggregate_version >= 1)
);

CREATE INDEX ix_projection_record_publication_generation
    ON consultation.projection_record(publication_id, generation_id, source_record_id);

CREATE TABLE consultation.projection_identifier (
    id UUID PRIMARY KEY,
    publication_id UUID NOT NULL,
    generation_id UUID NOT NULL REFERENCES consultation.projection_generation(id) ON DELETE CASCADE,
    projection_record_id UUID NOT NULL REFERENCES consultation.projection_record(id) ON DELETE CASCADE,
    identifier_type TEXT NOT NULL,
    normalization_version TEXT NOT NULL,
    normalized_hmac BYTEA NOT NULL,
    direct_result_allowed BOOLEAN NOT NULL DEFAULT false,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT uq_projection_identifier_exact UNIQUE (
        generation_id,
        identifier_type,
        normalized_hmac
    ),
    CONSTRAINT ck_projection_identifier_hmac_size CHECK (octet_length(normalized_hmac) = 32),
    CONSTRAINT ck_projection_identifier_type_not_blank CHECK (length(btrim(identifier_type)) > 0),
    CONSTRAINT ck_projection_identifier_normalization_not_blank CHECK (length(btrim(normalization_version)) > 0)
);

CREATE INDEX ix_projection_identifier_lookup
    ON consultation.projection_identifier(publication_id, generation_id, identifier_type, normalized_hmac);

CREATE TABLE consultation.projection_guard (
    publication_id UUID PRIMARY KEY,
    is_active BOOLEAN NOT NULL DEFAULT true,
    reason_code TEXT NOT NULL,
    details TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    released_at TIMESTAMPTZ,
    CONSTRAINT ck_projection_guard_reason CHECK (
        reason_code IN ('archive', 'sensitive_correction', 'rebuild_required', 'projection_error', 'operator_block')
    ),
    CONSTRAINT ck_projection_guard_dates CHECK (
        (is_active = true AND released_at IS NULL)
        OR (is_active = false AND released_at IS NOT NULL)
    )
);

CREATE INDEX ix_projection_guard_active
    ON consultation.publication_projection(publication_id)
    WHERE status <> 'indexee';

CREATE TABLE consultation.processed_event (
    id UUID PRIMARY KEY,
    consumer_name TEXT NOT NULL,
    event_id UUID NOT NULL,
    event_name TEXT NOT NULL,
    event_version INTEGER NOT NULL,
    aggregate_type TEXT NOT NULL,
    aggregate_id UUID NOT NULL,
    aggregate_version BIGINT NOT NULL,
    publication_id UUID NOT NULL,
    processed_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    payload_hash BYTEA NOT NULL,
    CONSTRAINT uq_processed_event_consumer_event UNIQUE (consumer_name, event_id),
    CONSTRAINT ck_processed_event_payload_hash CHECK (octet_length(payload_hash) = 32),
    CONSTRAINT ck_processed_event_versions CHECK (event_version >= 1 AND aggregate_version >= 1)
);

CREATE TABLE consultation.projection_aggregate_state (
    consumer_name TEXT NOT NULL,
    aggregate_type TEXT NOT NULL,
    aggregate_id UUID NOT NULL,
    publication_id UUID NOT NULL,
    last_aggregate_version BIGINT NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    PRIMARY KEY (consumer_name, aggregate_type, aggregate_id),
    CONSTRAINT ck_projection_aggregate_state_version CHECK (last_aggregate_version >= 1)
);

CREATE INDEX ix_processed_event_publication
    ON consultation.processed_event(publication_id, processed_at);

COMMIT;
