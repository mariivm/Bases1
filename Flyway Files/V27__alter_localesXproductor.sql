-- +FlywayNonRepeatable
ALTER TABLE [dbo].[localesXproceso]  WITH CHECK ADD  CONSTRAINT [FK_localesXproceso_localesXproductor_localId] FOREIGN KEY([localId])
REFERENCES [dbo].[localesXproductor] ([localId])
GO
ALTER TABLE [dbo].[localesXproceso] CHECK CONSTRAINT [FK_localesXproceso_localesXproductor_localId]
GO
ALTER TABLE [dbo].[localesXproceso]  WITH CHECK ADD  CONSTRAINT [FK_localesXproceso_tipoProcesoReco_procesoId] FOREIGN KEY([procesoRecoId])
REFERENCES [dbo].[tipoProcesoReco] ([procesoRecoId])
GO
ALTER TABLE [dbo].[localesXproceso] CHECK CONSTRAINT [FK_localesXproceso_tipoProcesoReco_procesoId]
GO
ALTER TABLE [dbo].[localesXproductor]  WITH CHECK ADD  CONSTRAINT [FK_localesXproductor_actores_actorId] FOREIGN KEY([actorId])
REFERENCES [dbo].[actores] ([actorId])
GO
ALTER TABLE [dbo].[localesXproductor] CHECK CONSTRAINT [FK_localesXproductor_actores_actorId]
GO
ALTER TABLE [dbo].[localesXproductor]  WITH CHECK ADD  CONSTRAINT [FK_localesXproductor_direcciones_localId] FOREIGN KEY([direccionId])
REFERENCES [dbo].[direcciones] ([direccionId])
GO
ALTER TABLE [dbo].[localesXproductor] CHECK CONSTRAINT [FK_localesXproductor_direcciones_localId]
GO
ALTER TABLE [dbo].[localesXproductor]  WITH CHECK ADD  CONSTRAINT [FK_localesXproductor_payType_patId] FOREIGN KEY([payId])
REFERENCES [dbo].[payType] ([payId])
GO
ALTER TABLE [dbo].[localesXproductor] CHECK CONSTRAINT [FK_localesXproductor_payType_patId]
GO


