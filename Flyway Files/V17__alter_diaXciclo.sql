-- +FlywayNonRepeatable
ALTER TABLE [dbo].[diaXciclo]  WITH CHECK ADD  CONSTRAINT [FK_diaXciclo_cicloRecoleccion_cicloId] FOREIGN KEY([cicloId])
REFERENCES [dbo].[cicloRecoleccion] ([cicloId])
GO
ALTER TABLE [dbo].[diaXciclo] CHECK CONSTRAINT [FK_diaXciclo_cicloRecoleccion_cicloId]
GO