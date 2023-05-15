Create type LogMovimientosR as table (
	userid int,
	recipienteid int,
	accion int,
	recolectora int,
	localid int,
	fecha datetime,
	checksum varbinary(150)
);


--Drop Procedure if exists GetnExchange
CREATE PROCEDURE GetnExchange
	@LogMovimientosTVP LogMovimientosR READONLY
AS
BEGIN
SET NOCOUNT ON 
DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
DECLARE @Message VARCHAR(200)
DECLARE @InicieTransaccion BIT
DECLARE @RollbackTransaccion BIT = 0

SET @InicieTransaccion = 0
IF @@TRANCOUNT=0 BEGIN
SET @InicieTransaccion = 1
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION
END
BEGIN TRY
SET @CustomError = 2001
-- put your code here
--Insert 
	insert into logMovimientos (userid, recipienteid,accionid,recolector,localid,fecha,checksum)
	SELECT * FROM @LogMovimientosTVP

 IF @@ERROR <> 0
      SET @RollbackTransaccion = 1
   IF @InicieTransaccion=1 AND @RollbackTransaccion = 0 BEGIN
      COMMIT
   END ELSE IF @InicieTransaccion=1 AND @RollbackTransaccion = 1 BEGIN
      ROLLBACK
   END
END TRY
BEGIN CATCH
   SET @ErrorNumber = ERROR_NUMBER()
   SET @ErrorSeverity = ERROR_SEVERITY()
   SET @ErrorState = ERROR_STATE()
   SET @Message = ERROR_MESSAGE()
   -- Cambiar la variable @RollbackTransaccion a 1 para hacer rollback
   SET @RollbackTransaccion = 1
   IF @InicieTransaccion=1 AND @RollbackTransaccion = 0 BEGIN
      COMMIT
   END ELSE IF @InicieTransaccion=1 AND @RollbackTransaccion = 1 BEGIN
      ROLLBACK
   END
   RAISERROR('%s - Error Number: %i',
   @ErrorSeverity, @ErrorState, @Message, @CustomError)
END CATCH
END
RETURN 0

