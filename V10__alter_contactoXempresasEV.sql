-- +FlywayNonRepeatable
ALTER TABLE [dbo].[contactoXempresaEV]  WITH CHECK ADD  CONSTRAINT [FK_contactoXempresaEV_contactValues_contactValueID] FOREIGN KEY([contactValueId])
REFERENCES [dbo].[contactValues] ([contactValueId])
GO
ALTER TABLE [dbo].[contactoXempresaEV] CHECK CONSTRAINT [FK_contactoXempresaEV_contactValues_contactValueID]
GO
ALTER TABLE [dbo].[contactoXempresaEV]  WITH CHECK ADD  CONSTRAINT [FK_contactoXempresaEV_empresasEV_empresaID] FOREIGN KEY([empresaId])
REFERENCES [dbo].[empresasEV] ([empresaId])
GO
ALTER TABLE [dbo].[contactoXempresaEV] CHECK CONSTRAINT [FK_contactoXempresaEV_empresasEV_empresaID]
GO