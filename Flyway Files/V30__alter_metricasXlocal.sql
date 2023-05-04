-- +FlywayNonRepeatable
ALTER TABLE [dbo].[metricasXlocal]  WITH CHECK ADD  CONSTRAINT [FK_metricasXlocal_localesXproductor_localId] FOREIGN KEY([localId])
REFERENCES [dbo].[localesXproductor] ([localId])
GO
ALTER TABLE [dbo].[metricasXlocal] CHECK CONSTRAINT [FK_metricasXlocal_localesXproductor_localId]
GO