-- +FlywayNonRepeatable
ALTER TABLE [dbo].[precioXpunto]  WITH CHECK ADD  CONSTRAINT [FK_precioXpunto_paises_paisId] FOREIGN KEY([paisId])
REFERENCES [dbo].[paises] ([paisId])
GO
ALTER TABLE [dbo].[precioXpunto] CHECK CONSTRAINT [FK_precioXpunto_paises_paisId]
GO
