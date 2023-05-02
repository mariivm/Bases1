-- +FlywayNonRepeatable
ALTER TABLE [dbo].[precioXkm]  WITH CHECK ADD  CONSTRAINT [FK_precioXkm_paises_paisId] FOREIGN KEY([paisId])
REFERENCES [dbo].[paises] ([paisId])
GO
ALTER TABLE [dbo].[precioXkm] CHECK CONSTRAINT [FK_precioXkm_paises_paisId]
GO
