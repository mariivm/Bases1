-- +FlywayNonRepeatable
ALTER TABLE [dbo].[idiomaXpaises]  WITH CHECK ADD  CONSTRAINT [FK_idiomaXpaises_idiomas_idiomasId] FOREIGN KEY([idiomaId])
REFERENCES [dbo].[idiomas] ([idiomaId])
GO
ALTER TABLE [dbo].[idiomaXpaises] CHECK CONSTRAINT [FK_idiomaXpaises_idiomas_idiomasId]
GO
ALTER TABLE [dbo].[idiomaXpaises]  WITH CHECK ADD  CONSTRAINT [FK_idiomaXpaises_paises_paisId] FOREIGN KEY([paisId])
REFERENCES [dbo].[paises] ([paisId])
GO
ALTER TABLE [dbo].[idiomaXpaises] CHECK CONSTRAINT [FK_idiomaXpaises_paises_paisId]
GO