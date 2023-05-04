-- +FlywayNonRepeatable
ALTER TABLE [dbo].[inventarioProductos]  WITH CHECK ADD  CONSTRAINT [FK_inventarioProductos_conversionProductos_conversionId] FOREIGN KEY([lote])
REFERENCES [dbo].[ordenProduccion] ([lote])
GO
ALTER TABLE [dbo].[inventarioProductos] CHECK CONSTRAINT [FK_inventarioProductos_conversionProductos_conversionId]
GO
ALTER TABLE [dbo].[inventarioProductos]  WITH CHECK ADD  CONSTRAINT [FK_inventarioProductos_productos_productoId] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([productoId])
GO
ALTER TABLE [dbo].[inventarioProductos] CHECK CONSTRAINT [FK_inventarioProductos_productos_productoId]
GO