-- +FlywayNonRepeatable
ALTER TABLE [dbo].[contratos]  WITH CHECK ADD  CONSTRAINT [FK_contratos_contratosGenerales_contratoId] FOREIGN KEY([contratoId])
REFERENCES [dbo].[contratosGenerales] ([contratoId])
GO
ALTER TABLE [dbo].[contratos] CHECK CONSTRAINT [FK_contratos_contratosGenerales_contratoId]
GO
ALTER TABLE [dbo].[contratos]  WITH CHECK ADD  CONSTRAINT [FK_contratos_empresasEV_empresaId] FOREIGN KEY([empresaId])
REFERENCES [dbo].[empresasEV] ([empresaId])
GO
ALTER TABLE [dbo].[contratos] CHECK CONSTRAINT [FK_contratos_empresasEV_empresaId]
GO
ALTER TABLE [dbo].[contratos]  WITH CHECK ADD  CONSTRAINT [FK_contratos_Traducciones_traduccionId] FOREIGN KEY([status])
REFERENCES [dbo].[Traducciones] ([traduccionId])
GO
ALTER TABLE [dbo].[contratos] CHECK CONSTRAINT [FK_contratos_Traducciones_traduccionId]
GO