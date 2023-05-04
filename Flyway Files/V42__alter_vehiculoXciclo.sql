-- +FlywayNonRepeatable
ALTER TABLE [dbo].[vehiculoXciclo]  WITH CHECK ADD  CONSTRAINT [FK_vehiculoXciclo_diaXciclo_id] FOREIGN KEY([dXcId])
REFERENCES [dbo].[diaXciclo] ([dXcId])
GO
ALTER TABLE [dbo].[vehiculoXciclo] CHECK CONSTRAINT [FK_vehiculoXciclo_diaXciclo_id]
GO
ALTER TABLE [dbo].[vehiculoXciclo]  WITH CHECK ADD  CONSTRAINT [FK_vehiculoXciclo_vehiculo_vehiculoId] FOREIGN KEY([vehiculoId])
REFERENCES [dbo].[vehiculo] ([vehiculoId])
GO
ALTER TABLE [dbo].[vehiculoXciclo] CHECK CONSTRAINT [FK_vehiculoXciclo_vehiculo_vehiculoId]
GO