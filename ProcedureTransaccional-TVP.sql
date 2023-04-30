CREATE TYPE [dbo].[TVPCaso] AS TABLE(
     [Columna1] [varchar](10)
)
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
IF @InicieTransaccion=1 BEGIN
COMMIT
END
END TRY
BEGIN CATCH
SET @ErrorNumber = ERROR_NUMBER()
SET @ErrorSeverity = ERROR_SEVERITY()
SET @ErrorState = ERROR_STATE()
SET @Message = ERROR_MESSAGE()
IF @InicieTransaccion=1 BEGIN
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