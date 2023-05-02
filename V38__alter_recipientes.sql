-- +FlywayNonRepeatable
ALTER TABLE [dbo].[recipientes]  WITH CHECK ADD  CONSTRAINT [FK_recipiente_categoriaProducto_categoriaId] FOREIGN KEY([categoriaId])
REFERENCES [dbo].[categoriaProducto] ([categoriaId])
GO
ALTER TABLE [dbo].[recipientes] CHECK CONSTRAINT [FK_recipiente_categoriaProducto_categoriaId]
GO
ALTER TABLE [dbo].[recipientes]  WITH CHECK ADD  CONSTRAINT [FK_recipiente_productos_productoId] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([productoId])
GO
ALTER TABLE [dbo].[recipientes] CHECK CONSTRAINT [FK_recipiente_productos_productoId]
GO
ALTER TABLE [dbo].[recipientes]  WITH CHECK ADD  CONSTRAINT [FK_recipientes_actores] FOREIGN KEY([actorId])
REFERENCES [dbo].[actores] ([actorId])
GO
ALTER TABLE [dbo].[recipientes] CHECK CONSTRAINT [FK_recipientes_actores]
GO