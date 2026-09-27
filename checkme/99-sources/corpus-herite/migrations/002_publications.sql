BEGIN;

CREATE TABLE publications.organization (
    id UUID PRIMARY KEY,
    code TEXT NOT NULL,
    name TEXT NOT NULL,
    status TEXT NOT NULL DEFAULT 'active',
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT uq_organization_code UNIQUE (code),
    CONSTRAINT ck_organization_status CHECK (status IN ('active', 'suspended', 'archived')),
    CONSTRAINT ck_organization_code_not_blank CHECK (length(btrim(code)) > 0),
    CONSTRAINT ck_organization_name_not_blank CHECK (length(btrim(name)) > 0)
);

CREATE TABLE publications.publication_model (
    id UUID PRIMARY KEY,
    organization_id UUID NOT NULL REFERENCES publications.organization(id),
    code TEXT NOT NULL,
    version INTEGER NOT NULL,
    status TEXT NOT NULL DEFAULT 'draft',
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT uq_model_org_code_version UNIQUE (organization_id, code, version),
    CONSTRAINT ck_model_version_positive CHECK (version >= 1),
    CONSTRAINT ck_model_status CHECK (status IN ('draft', 'active', 'retired'))
);

CREATE TABLE publications.identifier_type_policy (
    type_code TEXT PRIMARY KEY,
    default_matching_mode TEXT NOT NULL,
    allows_fuzzy BOOLEAN NOT NULL DEFAULT false,
    CONSTRAINT ck_identifier_type_policy_mode CHECK (default_matching_mode IN ('exacte', 'floue_controlee')),
    CONSTRAINT ck_identifier_type_policy_fuzzy CHECK (
        (allows_fuzzy = false AND default_matching_mode = 'exacte')
        OR allows_fuzzy = true
    )
);

INSERT INTO publications.identifier_type_policy (type_code, default_matching_mode, allows_fuzzy) VALUES
    ('cnib', 'exacte', false),
    ('numero_recepisse', 'exacte', false),
    ('numero_candidat', 'exacte', false),
    ('matricule', 'exacte', false),
    ('numero_dossier', 'exacte', false),
    ('nom_prenom', 'floue_controlee', true)
ON CONFLICT (type_code) DO NOTHING;

CREATE TABLE publications.identifier_definition (
    id UUID PRIMARY KEY,
    model_id UUID NOT NULL REFERENCES publications.publication_model(id) ON DELETE CASCADE,
    type_code TEXT NOT NULL,
    label TEXT NOT NULL,
    rank_confidence INTEGER NOT NULL,
    required_at_ingestion BOOLEAN NOT NULL DEFAULT false,
    matching_mode TEXT NOT NULL,
    normalization TEXT NOT NULL,
    direct_result_allowed BOOLEAN NOT NULL DEFAULT false,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT uq_identifier_definition_type UNIQUE (model_id, type_code),
    CONSTRAINT uq_identifier_definition_rank UNIQUE (model_id, rank_confidence),
    CONSTRAINT ck_identifier_rank_positive CHECK (rank_confidence >= 1),
    CONSTRAINT ck_identifier_matching_mode CHECK (matching_mode IN ('exacte', 'floue_controlee')),
    CONSTRAINT ck_identifier_label_not_blank CHECK (length(btrim(label)) > 0),
    CONSTRAINT ck_identifier_direct_result CHECK (
        matching_mode = 'exacte' OR direct_result_allowed = false
    )
);

CREATE TABLE publications.publication (
    id UUID PRIMARY KEY,
    organization_id UUID NOT NULL REFERENCES publications.organization(id),
    model_id UUID NOT NULL REFERENCES publications.publication_model(id),
    code TEXT NOT NULL,
    title TEXT NOT NULL,
    category_code TEXT NOT NULL,
    session_code TEXT,
    status TEXT NOT NULL DEFAULT 'brouillon',
    aggregate_version BIGINT NOT NULL DEFAULT 1,
    published_at TIMESTAMPTZ,
    archived_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT uq_publication_org_code UNIQUE (organization_id, code),
    CONSTRAINT ck_publication_status CHECK (status IN ('brouillon', 'publiee', 'archivee')),
    CONSTRAINT ck_publication_version_positive CHECK (aggregate_version >= 1),
    CONSTRAINT ck_publication_title_not_blank CHECK (length(btrim(title)) > 0),
    CONSTRAINT ck_publication_category_not_blank CHECK (length(btrim(category_code)) > 0)
);

CREATE TABLE publications.record (
    id UUID PRIMARY KEY,
    publication_id UUID NOT NULL REFERENCES publications.publication(id),
    external_key TEXT,
    aggregate_version BIGINT NOT NULL DEFAULT 1,
    lifecycle_status TEXT NOT NULL DEFAULT 'active',
    payload JSONB NOT NULL DEFAULT '{}'::jsonb,
    display_payload JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    deleted_at TIMESTAMPTZ,
    CONSTRAINT ck_record_version_positive CHECK (aggregate_version >= 1),
    CONSTRAINT ck_record_lifecycle CHECK (lifecycle_status IN ('active', 'deleted'))
);

CREATE UNIQUE INDEX uq_record_external_key_active
    ON publications.record(publication_id, external_key)
    WHERE external_key IS NOT NULL;

CREATE INDEX ix_record_publication_status
    ON publications.record(publication_id, lifecycle_status, id);

CREATE INDEX ix_publication_org_status
    ON publications.publication(organization_id, status, id);

CREATE INDEX ix_model_org
    ON publications.publication_model(organization_id, code, version);

COMMIT;
