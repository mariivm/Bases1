-- +FlywayNonRepeatable
ALTER TABLE [dbo].[costoProcesoXmateriales]  WITH CHECK ADD  CONSTRAINT [FK_costoProcesoXmateriales_empresasEV_empresaId] FOREIGN KEY([empresaId])
REFERENCES [dbo].[empresasEV] ([empresaId])
GO
ALTER TABLE [dbo].[costoProcesoXmateriales] CHECK CONSTRAINT [FK_costoProcesoXmateriales_empresasEV_empresaId]
GO
ALTER TABLE [dbo].[costoProcesoXmateriales]  WITH CHECK ADD  CONSTRAINT [FK_costoProcesoXmateriales_productos_productoId] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([productoId])
GO
ALTER TABLE [dbo].[costoProcesoXmateriales] CHECK CONSTRAINT [FK_costoProcesoXmateriales_productos_productoId]
GO