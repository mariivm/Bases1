-- +FlywayNonRepeatable
ALTER TABLE [dbo].[procesadoRecipientes]  WITH CHECK ADD  CONSTRAINT [FK_procesadoRecipientes_conversionProductos] FOREIGN KEY([lote])
REFERENCES [dbo].[ordenProduccion] ([lote])
GO
ALTER TABLE [dbo].[procesadoRecipientes] CHECK CONSTRAINT [FK_procesadoRecipientes_conversionProductos]
GO
ALTER TABLE [dbo].[procesadoRecipientes]  WITH CHECK ADD  CONSTRAINT [FK_procesadoRecipientes_recipiente_recipienteId] FOREIGN KEY([recipienteRetornado])
REFERENCES [dbo].[recipientes] ([recipienteId])
GO
ALTER TABLE [dbo].[procesadoRecipientes] CHECK CONSTRAINT [FK_procesadoRecipientes_recipiente_recipienteId]
GO
ALTER TABLE [dbo].[procesadoRecipientes]  WITH CHECK ADD  CONSTRAINT [FK_procesadoRecipientes_tipoProcesado_procesadoId] FOREIGN KEY([procesadoId])
REFERENCES [dbo].[tipoProcesado] ([procesadoId])
GO
ALTER TABLE [dbo].[procesadoRecipientes] CHECK CONSTRAINT [FK_procesadoRecipientes_tipoProcesado_procesadoId]
GO