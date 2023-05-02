-- +FlywayNonRepeatable
ALTER TABLE [dbo].[recepcionDesechos]  WITH CHECK ADD  CONSTRAINT [FK_recepcionDesechos_empresasEV_empresaId] FOREIGN KEY([empresaId])
REFERENCES [dbo].[empresasEV] ([empresaId])
GO
ALTER TABLE [dbo].[recepcionDesechos] CHECK CONSTRAINT [FK_recepcionDesechos_empresasEV_empresaId]
GO
ALTER TABLE [dbo].[recepcionDesechos]  WITH CHECK ADD  CONSTRAINT [FK_recepcionDesechos_localesXproductor_localId] FOREIGN KEY([localId])
REFERENCES [dbo].[localesXproductor] ([localId])
GO
ALTER TABLE [dbo].[recepcionDesechos] CHECK CONSTRAINT [FK_recepcionDesechos_localesXproductor_localId]
GO
ALTER TABLE [dbo].[recepcionDesechos]  WITH CHECK ADD  CONSTRAINT [FK_recepcionDesechos_recipiente_recipienteId] FOREIGN KEY([recipienteId])
REFERENCES [dbo].[recipientes] ([recipienteId])
GO
ALTER TABLE [dbo].[recepcionDesechos] CHECK CONSTRAINT [FK_recepcionDesechos_recipiente_recipienteId]
GO