-- +FlywayNonRepeatable
ALTER TABLE [dbo].[recipienteXlocal]  WITH CHECK ADD  CONSTRAINT [FK_recipienteXlocal_localesXproductor_localId] FOREIGN KEY([localId])
REFERENCES [dbo].[localesXproductor] ([localId])
GO
ALTER TABLE [dbo].[recipienteXlocal] CHECK CONSTRAINT [FK_recipienteXlocal_localesXproductor_localId]
GO
ALTER TABLE [dbo].[recipienteXlocal]  WITH CHECK ADD  CONSTRAINT [FK_recipienteXlocal_recipiente_recipienteId] FOREIGN KEY([recipienteId])
REFERENCES [dbo].[recipientes] ([recipienteId])
GO
ALTER TABLE [dbo].[recipienteXlocal] CHECK CONSTRAINT [FK_recipienteXlocal_recipiente_recipienteId]
GO
