-- +FlywayNonRepeatable
ALTER TABLE [dbo].[contactoXlocal]  WITH CHECK ADD  CONSTRAINT [FK_contactoXlocal_contactValues_contactValueId] FOREIGN KEY([contactValueId])
REFERENCES [dbo].[contactValues] ([contactValueId])
GO
ALTER TABLE [dbo].[contactoXlocal] CHECK CONSTRAINT [FK_contactoXlocal_contactValues_contactValueId]
GO
ALTER TABLE [dbo].[contactoXlocal]  WITH CHECK ADD  CONSTRAINT [FK_contactoXlocal_localesXproductor_localId] FOREIGN KEY([localId])
REFERENCES [dbo].[localesXproductor] ([localId])
GO
ALTER TABLE [dbo].[contactoXlocal] CHECK CONSTRAINT [FK_contactoXlocal_localesXproductor_localId]
GO