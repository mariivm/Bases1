-- +FlywayNonRepeatable
ALTER TABLE [dbo].[ContaminantesPagosEmpresas]  WITH CHECK ADD  CONSTRAINT [FK_ContaminantesPagosEmpresas_localesXproductor_local] FOREIGN KEY([localId])
REFERENCES [dbo].[localesXproductor] ([localId])
GO
ALTER TABLE [dbo].[ContaminantesPagosEmpresas] CHECK CONSTRAINT [FK_ContaminantesPagosEmpresas_localesXproductor_local]
GO
ALTER TABLE [dbo].[ContaminantesPagosEmpresas]  WITH CHECK ADD  CONSTRAINT [FK_ContaminantesPagosEmpresas_localesXproductor_localId] FOREIGN KEY([contaminante])
REFERENCES [dbo].[localesXproductor] ([localId])
GO
ALTER TABLE [dbo].[ContaminantesPagosEmpresas] CHECK CONSTRAINT [FK_ContaminantesPagosEmpresas_localesXproductor_localId]
GO