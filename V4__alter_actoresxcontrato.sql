-- +FlywayNonRepeatable
ALTER TABLE [dbo].[actoresXcontratoXproducto]  WITH CHECK ADD  CONSTRAINT [FK_actoresXcontratoXproducto_contratosGenerales_contratoId] FOREIGN KEY([contratoId])
REFERENCES [dbo].[contratosGenerales] ([contratoId])
GO
ALTER TABLE [dbo].[actoresXcontratoXproducto] CHECK CONSTRAINT [FK_actoresXcontratoXproducto_contratosGenerales_contratoId]
GO
ALTER TABLE [dbo].[actoresXcontratoXproducto]  WITH CHECK ADD  CONSTRAINT [FK_actoresXcontratoXproducto_localesXproductor_localId] FOREIGN KEY([localId])
REFERENCES [dbo].[localesXproductor] ([localId])
GO
ALTER TABLE [dbo].[actoresXcontratoXproducto] CHECK CONSTRAINT [FK_actoresXcontratoXproducto_localesXproductor_localId]
GO
ALTER TABLE [dbo].[actoresXcontratoXproducto]  WITH CHECK ADD  CONSTRAINT [FK_actoresXcontratoXproducto_productos_productoId] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([productoId])
GO
ALTER TABLE [dbo].[actoresXcontratoXproducto] CHECK CONSTRAINT [FK_actoresXcontratoXproducto_productos_productoId]
GO