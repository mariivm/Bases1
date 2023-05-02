-- +FlywayNonRepeatable
ALTER TABLE [dbo].[empresaEVXvehiculo]  WITH CHECK ADD  CONSTRAINT [FK_empresaEVXvehiculo_empresasEV_empresaId] FOREIGN KEY([empresaId])
REFERENCES [dbo].[empresasEV] ([empresaId])
GO
ALTER TABLE [dbo].[empresaEVXvehiculo] CHECK CONSTRAINT [FK_empresaEVXvehiculo_empresasEV_empresaId]
GO
ALTER TABLE [dbo].[empresaEVXvehiculo]  WITH CHECK ADD  CONSTRAINT [FK_empresaEVXvehiculo_vehiculo_vehiculoId] FOREIGN KEY([vehiculoId])
REFERENCES [dbo].[vehiculo] ([vehiculoId])
GO
ALTER TABLE [dbo].[empresaEVXvehiculo] CHECK CONSTRAINT [FK_empresaEVXvehiculo_vehiculo_vehiculoId]
GO