-- +FlywayNonRepeatable
ALTER TABLE [dbo].[ordenProduccion]  WITH CHECK ADD  CONSTRAINT [FK_conversionProductos_actores_actorId] FOREIGN KEY([actorId])
REFERENCES [dbo].[actores] ([actorId])
GO
ALTER TABLE [dbo].[ordenProduccion] CHECK CONSTRAINT [FK_conversionProductos_actores_actorId]
GO
ALTER TABLE [dbo].[ordenProduccion]  WITH CHECK ADD  CONSTRAINT [FK_conversionProductos_productos_productoId] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([productoId])
GO
ALTER TABLE [dbo].[ordenProduccion] CHECK CONSTRAINT [FK_conversionProductos_productos_productoId]
GO
ALTER TABLE [dbo].[ordenProduccion]  WITH CHECK ADD  CONSTRAINT [FK_conversionProductos_recepcionDesechos_recepcionId] FOREIGN KEY([recepcionId])
REFERENCES [dbo].[recepcionDesechos] ([recepcionId])
GO
ALTER TABLE [dbo].[ordenProduccion] CHECK CONSTRAINT [FK_conversionProductos_recepcionDesechos_recepcionId]
GO
