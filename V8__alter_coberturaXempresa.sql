-- +FlywayNonRepeatable
ALTER TABLE [dbo].[coberturaXempresas]  WITH CHECK ADD  CONSTRAINT [FK_coberturaXempresas_empresasEV_empresaId] FOREIGN KEY([empresaId])
REFERENCES [dbo].[empresasEV] ([empresaId])
GO
ALTER TABLE [dbo].[coberturaXempresas] CHECK CONSTRAINT [FK_coberturaXempresas_empresasEV_empresaId]
GO
ALTER TABLE [dbo].[coberturaXempresas]  WITH CHECK ADD  CONSTRAINT [FK_coberturaXempresas_paises_paisId] FOREIGN KEY([paisId])
REFERENCES [dbo].[paises] ([paisId])
GO
ALTER TABLE [dbo].[coberturaXempresas] CHECK CONSTRAINT [FK_coberturaXempresas_paises_paisId]
GO