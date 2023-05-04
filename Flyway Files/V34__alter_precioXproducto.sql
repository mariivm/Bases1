-- +FlywayNonRepeatable
ALTER TABLE [dbo].[precioXproducto]  WITH CHECK ADD  CONSTRAINT [FK_precioXproducto_empresasEV_empresaId] FOREIGN KEY([empresaId])
REFERENCES [dbo].[empresasEV] ([empresaId])
GO
ALTER TABLE [dbo].[precioXproducto] CHECK CONSTRAINT [FK_precioXproducto_empresasEV_empresaId]
GO
ALTER TABLE [dbo].[precioXproducto]  WITH CHECK ADD  CONSTRAINT [FK_precioXproducto_productos_productoId] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([productoId])
GO
ALTER TABLE [dbo].[precioXproducto] CHECK CONSTRAINT [FK_precioXproducto_productos_productoId]
GO