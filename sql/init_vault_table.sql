CREATE DATABASE vault;

\c vault

-- Create initial Schema and Indexes
CREATE TABLE vault_kv_store (
  parent_path TEXT COLLATE "C" NOT NULL,
  path        TEXT COLLATE "C",
  key         TEXT COLLATE "C",
  value       BYTEA,
  CONSTRAINT pkey PRIMARY KEY (path, key)
);

CREATE INDEX parent_path_idx ON vault_kv_store (parent_path);

-- Store for HAEnabled backend
CREATE TABLE vault_ha_locks (
  ha_key                                      TEXT COLLATE "C" NOT NULL,
  ha_identity                                 TEXT COLLATE "C" NOT NULL,
  ha_value                                    TEXT COLLATE "C",
  valid_until                                 TIMESTAMP WITH TIME ZONE NOT NULL,
  CONSTRAINT ha_key PRIMARY KEY (ha_key)
);

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO postgres;
