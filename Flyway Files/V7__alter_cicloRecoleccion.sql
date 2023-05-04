-- +FlywayNonRepeatable
ALTER TABLE [dbo].[cicloRecoleccion]  WITH CHECK ADD  CONSTRAINT [FK_cicloRecoleccion_localesXproductor_localId] FOREIGN KEY([localId])
REFERENCES [dbo].[localesXproductor] ([localId])
GO
ALTER TABLE [dbo].[cicloRecoleccion] CHECK CONSTRAINT [FK_cicloRecoleccion_localesXproductor_localId]
GO
ALTER TABLE [dbo].[cicloRecoleccion]  WITH CHECK ADD  CONSTRAINT [FK_cicloRecoleccion_ubicacionXlocal_ubicacionId] FOREIGN KEY([cicloId])
REFERENCES [dbo].[ubicacionXlocal] ([ubicacionId])
GO
ALTER TABLE [dbo].[cicloRecoleccion] CHECK CONSTRAINT [FK_cicloRecoleccion_ubicacionXlocal_ubicacionId]
GO