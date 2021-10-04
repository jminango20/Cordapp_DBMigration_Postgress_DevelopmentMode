CREATE USER "ijc" WITH LOGIN PASSWORD '1234';
CREATE SCHEMA "ijc_schema";
GRANT USAGE, CREATE ON SCHEMA "ijc_schema" TO "ijc";
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON ALL tables IN SCHEMA "ijc_schema" TO "ijc";
ALTER DEFAULT privileges IN SCHEMA "ijc_schema" GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON tables TO "ijc";
GRANT USAGE, SELECT ON ALL sequences IN SCHEMA "ijc_schema" TO "ijc";
ALTER DEFAULT privileges IN SCHEMA "ijc_schema" GRANT USAGE, SELECT ON sequences TO "ijc";
ALTER ROLE "ijc" SET search_path = "ijc_schema";