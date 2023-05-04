-- +FlywayNonRepeatable
ALTER TABLE [dbo].[contactValues]  WITH CHECK ADD  CONSTRAINT [FK_contactValues_contactType_id] FOREIGN KEY([contactTypeId])
REFERENCES [dbo].[contactType] ([contactTypeId])
GO
ALTER TABLE [dbo].[contactValues] CHECK CONSTRAINT [FK_contactValues_contactType_id]
GO