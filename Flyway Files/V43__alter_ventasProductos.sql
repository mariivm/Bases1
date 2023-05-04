-- +FlywayNonRepeatable
ALTER TABLE [dbo].[ventasProductos]  WITH CHECK ADD  CONSTRAINT [FK_ventasProductos_clientes_clienteId] FOREIGN KEY([clienteId])
REFERENCES [dbo].[clientes] ([clienteId])
GO
ALTER TABLE [dbo].[ventasProductos] CHECK CONSTRAINT [FK_ventasProductos_clientes_clienteId]
GO
ALTER TABLE [dbo].[ventasProductos]  WITH CHECK ADD  CONSTRAINT [FK_ventasProductos_conversionProductos_conversionId] FOREIGN KEY([lote])
REFERENCES [dbo].[ordenProduccion] ([lote])
GO
ALTER TABLE [dbo].[ventasProductos] CHECK CONSTRAINT [FK_ventasProductos_conversionProductos_conversionId]
GO
ALTER TABLE [dbo].[ventasProductos]  WITH CHECK ADD  CONSTRAINT [FK_ventasProductos_empresasEV_empresaId] FOREIGN KEY([empresaId])
REFERENCES [dbo].[empresasEV] ([empresaId])
GO
ALTER TABLE [dbo].[ventasProductos] CHECK CONSTRAINT [FK_ventasProductos_empresasEV_empresaId]
GO
ALTER TABLE [dbo].[ventasProductos]  WITH CHECK ADD  CONSTRAINT [FK_ventasProductos_productos_productoId] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([productoId])
GO
ALTER TABLE [dbo].[ventasProductos] CHECK CONSTRAINT [FK_ventasProductos_productos_productoId]
GO