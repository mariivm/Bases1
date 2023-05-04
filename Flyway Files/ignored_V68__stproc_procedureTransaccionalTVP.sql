CREATE TYPE [dbo].[TVPCaso] AS TABLE(
     [Columna1] [varchar](10)
)
DROP PROCEDURE IF EXISTS procCaso;

CREATE PROCEDURE procCaso
@Param1 NVARCHAR(35),
@Param2 BIGINT,
@TVPpar TVPCaso READONLY
AS
BEGIN
SET NOCOUNT ON 
DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
DECLARE @Message VARCHAR(200)
DECLARE @InicieTransaccion BIT
DECLARE @RollbackTransaccion BIT = 0

-- declaracion de otras variables
-- operaciones de select que no tengan que ser bloqueadas
-- tratar de hacer todo lo posible antes de q inice la transaccion
SET @InicieTransaccion = 0
IF @@TRANCOUNT=0 BEGIN
SET @InicieTransaccion = 1
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION
END
BEGIN TRY
SET @CustomError = 2001
-- put your code here
SELECT * FROM @TVPPar
-- Agregar esto si se quiere error: SELECT 1/0
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


DECLARE @TVP TVPCaso
INSERT INTO @TVP VALUES ('Valor')
EXEC procCaso @Param1 = 'Para1', @Param2 = 1, @TVPPar = @TVP;
