-- +FlywayNonRepeatable
ALTER TABLE [dbo].[actores]  WITH CHECK ADD  CONSTRAINT [FK_actores_tipoActores_tipoActorId] FOREIGN KEY([tipoActorId])
REFERENCES [dbo].[tipoActores] ([tipoActorId])
GO
ALTER TABLE [dbo].[actores] CHECK CONSTRAINT [FK_actores_tipoActores_tipoActorId]
GO