-- +FlywayNonRepeatable
ALTER TABLE [dbo].[Event log]  WITH CHECK ADD  CONSTRAINT [FK_Event log_eventTypes_eventTypesId] FOREIGN KEY([evenTypeId])
REFERENCES [dbo].[eventTypes] ([EventTypeId])
GO
ALTER TABLE [dbo].[Event log] CHECK CONSTRAINT [FK_Event log_eventTypes_eventTypesId]
GO
ALTER TABLE [dbo].[Event log]  WITH CHECK ADD  CONSTRAINT [FK_Event log_levels_levelId] FOREIGN KEY([levelId])
REFERENCES [dbo].[levels] ([levelId])
GO
ALTER TABLE [dbo].[Event log] CHECK CONSTRAINT [FK_Event log_levels_levelId]
GO
ALTER TABLE [dbo].[Event log]  WITH CHECK ADD  CONSTRAINT [FK_Event log_objectTypes_objectTypeId] FOREIGN KEY([objectTypeId])
REFERENCES [dbo].[objectTypes] ([objectTypesId])
GO
ALTER TABLE [dbo].[Event log] CHECK CONSTRAINT [FK_Event log_objectTypes_objectTypeId]
GO
ALTER TABLE [dbo].[Event log]  WITH CHECK ADD  CONSTRAINT [FK_Event log_source_sourceId] FOREIGN KEY([sourceId])
REFERENCES [dbo].[source] ([sourceId])
GO
ALTER TABLE [dbo].[Event log] CHECK CONSTRAINT [FK_Event log_source_sourceId]
GO