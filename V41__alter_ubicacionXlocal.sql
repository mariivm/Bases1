-- +FlywayNonRepeatable
ALTER TABLE [dbo].[ubicacionXlocal]  WITH CHECK ADD  CONSTRAINT [FK_ubicacionXlocal_localesXproductor_localId] FOREIGN KEY([localId])
REFERENCES [dbo].[localesXproductor] ([localId])
GO
ALTER TABLE [dbo].[ubicacionXlocal] CHECK CONSTRAINT [FK_ubicacionXlocal_localesXproductor_localId]
GO
ALTER TABLE [dbo].[ubicacionXlocal]  WITH CHECK ADD  CONSTRAINT [FK_ubicacionXlocal_paises_paisId] FOREIGN KEY([paisId])
REFERENCES [dbo].[paises] ([paisId])
GO
ALTER TABLE [dbo].[ubicacionXlocal] CHECK CONSTRAINT [FK_ubicacionXlocal_paises_paisId]
GO