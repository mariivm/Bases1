-- +FlywayNonRepeatable
ALTER TABLE [dbo].[contactoXactores]  WITH CHECK ADD  CONSTRAINT [FK_contactoXactores_actores_actorId] FOREIGN KEY([actorId])
REFERENCES [dbo].[actores] ([actorId])
GO
ALTER TABLE [dbo].[contactoXactores] CHECK CONSTRAINT [FK_contactoXactores_actores_actorId]
GO
ALTER TABLE [dbo].[contactoXactores]  WITH CHECK ADD  CONSTRAINT [FK_contactoXactores_contactValues_id] FOREIGN KEY([contactValueId])
REFERENCES [dbo].[contactValues] ([contactValueId])
GO
ALTER TABLE [dbo].[contactoXactores] CHECK CONSTRAINT [FK_contactoXactores_contactValues_id]
GO