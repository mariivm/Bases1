-- +FlywayNonRepeatable
ALTER TABLE [dbo].[cantidadDesechosXlocal]  WITH CHECK ADD  CONSTRAINT [FK_cantidadDesechosXlocal_localesXproductor_localId] FOREIGN KEY([localId])
REFERENCES [dbo].[localesXproductor] ([localId])
GO
ALTER TABLE [dbo].[cantidadDesechosXlocal] CHECK CONSTRAINT [FK_cantidadDesechosXlocal_localesXproductor_localId]
GO
ALTER TABLE [dbo].[cantidadDesechosXlocal]  WITH CHECK ADD  CONSTRAINT [FK_cantidadDesechosXlocal_productos_productoId] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([productoId])
GO
ALTER TABLE [dbo].[cantidadDesechosXlocal] CHECK CONSTRAINT [FK_cantidadDesechosXlocal_productos_productoId]
GO