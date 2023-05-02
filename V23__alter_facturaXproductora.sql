-- +FlywayNonRepeatable
ALTER TABLE [dbo].[facturaXproductora]  WITH CHECK ADD  CONSTRAINT [FK_facturaXproductora_localesXproductor_localId] FOREIGN KEY([localId])
REFERENCES [dbo].[localesXproductor] ([localId])
GO
ALTER TABLE [dbo].[facturaXproductora] CHECK CONSTRAINT [FK_facturaXproductora_localesXproductor_localId]
GO