-- +FlywayNonRepeatable
ALTER TABLE [dbo].[logpagos]  WITH CHECK ADD  CONSTRAINT [FK_logpagos_actores_actorId] FOREIGN KEY([actorId])
REFERENCES [dbo].[actores] ([actorId])
GO
ALTER TABLE [dbo].[logpagos] CHECK CONSTRAINT [FK_logpagos_actores_actorId]
GO