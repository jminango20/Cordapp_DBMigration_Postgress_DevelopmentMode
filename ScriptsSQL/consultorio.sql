CREATE USER "consultorio" WITH LOGIN PASSWORD '1234';
CREATE SCHEMA "consultorio_schema";
GRANT USAGE, CREATE ON SCHEMA "consultorio_schema" TO "consultorio";
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON ALL tables IN SCHEMA "consultorio_schema" TO "consultorio";
ALTER DEFAULT privileges IN SCHEMA "consultorio_schema" GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON tables TO "consultorio";
GRANT USAGE, SELECT ON ALL sequences IN SCHEMA "consultorio_schema" TO "consultorio";
ALTER DEFAULT privileges IN SCHEMA "consultorio_schema" GRANT USAGE, SELECT ON sequences TO "consultorio";
ALTER ROLE "consultorio" SET search_path = "consultorio_schema";
