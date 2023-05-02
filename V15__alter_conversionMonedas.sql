-- +FlywayNonRepeatable
ALTER TABLE [dbo].[conversionMonedas]  WITH CHECK ADD  CONSTRAINT [FK_conversionMonedas_divisas_divisaId_base] FOREIGN KEY([monedaBase])
REFERENCES [dbo].[divisas] ([divisaId])
GO
ALTER TABLE [dbo].[conversionMonedas] CHECK CONSTRAINT [FK_conversionMonedas_divisas_divisaId_base]
GO
ALTER TABLE [dbo].[conversionMonedas]  WITH CHECK ADD  CONSTRAINT [FK_conversionMonedas_divisas_divisaId_Destino] FOREIGN KEY([monedaDest])
REFERENCES [dbo].[divisas] ([divisaId])
GO
ALTER TABLE [dbo].[conversionMonedas] CHECK CONSTRAINT [FK_conversionMonedas_divisas_divisaId_Destino]
GO