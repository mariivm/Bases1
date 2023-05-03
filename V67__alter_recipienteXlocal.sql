-- +FlywayNonRepeatable
DELETE FROM recipienteXlocal;

  ALTER TABLE recipienteXlocal ADD CONSTRAINT uc_recipienteXlocal UNIQUE (localId, recipienteId);
