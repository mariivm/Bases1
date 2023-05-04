-- +FlywayNonRepeatable
ALTER TABLE [dbo].[empresasEV]  WITH CHECK ADD  CONSTRAINT [FK_empresasEV_direcciones_direccionId] FOREIGN KEY([direccionId])
REFERENCES [dbo].[direcciones] ([direccionId])
GO
ALTER TABLE [dbo].[empresasEV] CHECK CONSTRAINT [FK_empresasEV_direcciones_direccionId]
GO