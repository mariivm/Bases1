-- +FlywayNonRepeatable
ALTER TABLE [dbo].[categoriaXproductos]  WITH CHECK ADD  CONSTRAINT [FK_categoriaXporductos_categoriaProducto_categoriaId] FOREIGN KEY([categoriaId])
REFERENCES [dbo].[categoriaProducto] ([categoriaId])
GO
ALTER TABLE [dbo].[categoriaXproductos] CHECK CONSTRAINT [FK_categoriaXporductos_categoriaProducto_categoriaId]
GO
ALTER TABLE [dbo].[categoriaXproductos]  WITH CHECK ADD  CONSTRAINT [FK_categoriaXporductos_productos_productoId] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([productoId])
GO
ALTER TABLE [dbo].[categoriaXproductos] CHECK CONSTRAINT [FK_categoriaXporductos_productos_productoId]
GO