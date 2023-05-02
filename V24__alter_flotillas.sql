-- +FlywayNonRepeatable
ALTER TABLE [dbo].[flotillas]  WITH CHECK ADD  CONSTRAINT [FK_flotillas_paises_paisId] FOREIGN KEY([paisId])
REFERENCES [dbo].[paises] ([paisId])
GO
ALTER TABLE [dbo].[flotillas] CHECK CONSTRAINT [FK_flotillas_paises_paisId]
GO
ALTER TABLE [dbo].[flotillas]  WITH CHECK ADD  CONSTRAINT [FK_flotillas_vehiculo_vehiculoId] FOREIGN KEY([vehiculoId])
REFERENCES [dbo].[vehiculo] ([vehiculoId])
GO
ALTER TABLE [dbo].[flotillas] CHECK CONSTRAINT [FK_flotillas_vehiculo_vehiculoId]
GO