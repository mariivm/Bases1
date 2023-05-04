-- +FlywayNonRepeatable
ALTER TABLE [dbo].[divisasXpais]  WITH CHECK ADD  CONSTRAINT [FK_divisasXpais_divisas_divisaId] FOREIGN KEY([divisaId])
REFERENCES [dbo].[divisas] ([divisaId])
GO
ALTER TABLE [dbo].[divisasXpais] CHECK CONSTRAINT [FK_divisasXpais_divisas_divisaId]
GO
ALTER TABLE [dbo].[divisasXpais]  WITH CHECK ADD  CONSTRAINT [FK_divisasXpais_paises_paisId] FOREIGN KEY([paisId])
REFERENCES [dbo].[paises] ([paisId])
GO
ALTER TABLE [dbo].[divisasXpais] CHECK CONSTRAINT [FK_divisasXpais_paises_paisId]
GO