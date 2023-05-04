-- +FlywayNonRepeatable
ALTER TABLE [dbo].[payType]  WITH CHECK ADD  CONSTRAINT [FK_payType_Traducciones_traduccionId] FOREIGN KEY([descripcion])
REFERENCES [dbo].[Traducciones] ([traduccionId])
GO
ALTER TABLE [dbo].[payType] CHECK CONSTRAINT [FK_payType_Traducciones_traduccionId]
GO