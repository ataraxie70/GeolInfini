BEGIN;

CREATE TABLE publications.outbox_event (
    id UUID PRIMARY KEY,
    event_name TEXT NOT NULL,
    event_version INTEGER NOT NULL,
    emitted_by TEXT NOT NULL,
    occurred_at TIMESTAMPTZ NOT NULL,
    correlation_id UUID,
    causation_id UUID,
    aggregate_type TEXT NOT NULL,
    aggregate_id UUID NOT NULL,
    aggregate_version BIGINT NOT NULL,
    publication_id UUID NOT NULL REFERENCES publications.publication(id),
    payload JSONB NOT NULL,
    status TEXT NOT NULL DEFAULT 'pending',
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT uq_outbox_aggregate_version UNIQUE (aggregate_type, aggregate_id, aggregate_version),
    CONSTRAINT ck_outbox_event_version_positive CHECK (event_version >= 1),
    CONSTRAINT ck_outbox_aggregate_version_positive CHECK (aggregate_version >= 1),
    CONSTRAINT ck_outbox_status CHECK (status IN ('pending', 'processing', 'delivered', 'dead_letter')),
    CONSTRAINT ck_outbox_event_name_not_blank CHECK (length(btrim(event_name)) > 0),
    CONSTRAINT ck_outbox_emitter_not_blank CHECK (length(btrim(emitted_by)) > 0)
);

CREATE INDEX ix_outbox_pending
    ON publications.outbox_event(status, created_at, id)
    WHERE status IN ('pending', 'processing');

CREATE INDEX ix_outbox_publication
    ON publications.outbox_event(publication_id, aggregate_version, occurred_at);

CREATE TABLE publications.outbox_delivery (
    id UUID PRIMARY KEY,
    event_id UUID NOT NULL REFERENCES publications.outbox_event(id) ON DELETE CASCADE,
    consumer_name TEXT NOT NULL,
    status TEXT NOT NULL DEFAULT 'pending',
    attempt_count INTEGER NOT NULL DEFAULT 0,
    next_attempt_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    locked_until TIMESTAMPTZ,
    last_error TEXT,
    delivered_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT uq_outbox_delivery_event_consumer UNIQUE (event_id, consumer_name),
    CONSTRAINT ck_outbox_delivery_status CHECK (status IN ('pending', 'processing', 'delivered', 'dead_letter')),
    CONSTRAINT ck_outbox_attempt_nonnegative CHECK (attempt_count >= 0),
    CONSTRAINT ck_outbox_consumer_not_blank CHECK (length(btrim(consumer_name)) > 0)
);

CREATE INDEX ix_outbox_delivery_claim
    ON publications.outbox_delivery(consumer_name, status, next_attempt_at, locked_until, id)
    WHERE status IN ('pending', 'processing');

CREATE INDEX ix_outbox_delivery_event
    ON publications.outbox_delivery(event_id, status);

COMMIT;
