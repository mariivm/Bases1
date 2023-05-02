-- +FlywayNonRepeatable
ALTER TABLE [dbo].[logUbicacionRecipiente]  WITH CHECK ADD  CONSTRAINT [FK_logUbicacionRecipiente_direcciones_direccionId] FOREIGN KEY([direccionId])
REFERENCES [dbo].[direcciones] ([direccionId])
GO
ALTER TABLE [dbo].[logUbicacionRecipiente] CHECK CONSTRAINT [FK_logUbicacionRecipiente_direcciones_direccionId]
GO
ALTER TABLE [dbo].[logUbicacionRecipiente]  WITH CHECK ADD  CONSTRAINT [FK_logUbicacionRecipiente_recipiente_recipienteId] FOREIGN KEY([recipienteId])
REFERENCES [dbo].[recipientes] ([recipienteId])
GO
ALTER TABLE [dbo].[logUbicacionRecipiente] CHECK CONSTRAINT [FK_logUbicacionRecipiente_recipiente_recipienteId]
GO