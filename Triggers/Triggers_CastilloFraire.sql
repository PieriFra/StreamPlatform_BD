-- Trigger para verificar si una cuenta no pago despues de cinco dias de la fecha de abono.
-- Si el pago no se efectuo se cambia el estado de la cuenta a inactivo. 
DELIMITER $$
CREATE TRIGGER check_payment_status 
AFTER INSERT ON abono
FOR EACH ROW
BEGIN
    DECLARE vencimiento DATE ;
    DECLARE hoy DATE;
    DECLARE diferencia INT;
    DECLARE cuenta_mail VARCHAR(45);

    -- Obtener la fecha de vencimiento de la factura
    SELECT FechaVen INTO vencimiento FROM abono WHERE idOperacion = NEW.idOperacion;

    -- Obtener la fecha de hoy
    SET hoy = CURDATE();
    
    -- Calcular la diferencia en días entre la fecha actual y la fecha de vencimiento
    SET diferencia = DATEDIFF(hoy, vencimiento);
    
    -- Obtengo el mail asociado a la cuenta asociada a la factura
	SELECT mail INTO cuenta_mail FROM cuenta WHERE mail = NEW.mail;
    
    -- Verificar si la diferencia es mayor a 5 días y si no se ha realizado el pago
    IF diferencia >= 5 AND NEW.idOperacion NOT IN (SELECT idOperacion FROM abono) THEN
        -- Actualizar el estado de la cuenta a "inactivo"
        UPDATE cuenta SET cuenta.estado = 'inactivo' WHERE cuenta.mail = cuenta_mail;
	END IF;
END $$
DELIMITER ;

-- Trigger que limita a 3 la cantidad de usuarios asociados a Tiene.
DELIMITER //
CREATE TRIGGER Verificar_Asociacion_usuarios
BEFORE INSERT ON Tiene
FOR EACH ROW
BEGIN

    DECLARE Cuentacount INT;
    
    -- Obtener la cantidad de usuarios asociados a la cuenta
    SELECT COUNT(*) INTO Cuentacount
    FROM Tiene
    WHERE Mail = NEW.Mail;
    
    -- Verificar si la cuenta puede asociar un usuario nuevo
    IF Cuentacount >= 3 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'No se puede asociar otro usuario a esta cuenta ya que tiene 5 usuarios.';
    END IF;
END;

-- Trigger que limita la cantidad de dispositivos asociados a cada usuario a cinco. 
DELIMITER //
CREATE TRIGGER enforce_cantDispositivo_limit
BEFORE INSERT ON usuario
FOR EACH ROW
BEGIN
	-- Verifico que la cantidad de dispositivos no supere la cantidad de cinco 
    IF NEW.cantDispositivo > 5 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El usuario no puede tener mas de 5 dispositivos asociados.';
    END IF;
END;

-- Trigger que limita la cantidad de favoritos por cada usuario a diez.
CREATE TRIGGER 
BEFORE UPDATE ON favorito 
FOR EACH ROW 
BEGIN
DECLARE 
	favorito_count INT;
    
    -- Contar la cantidad de favoritos que tienen el usuario
    SET favorito_count := (
    SELECT COUNT(*)
    FROM Favorito
    WHERE Nombre = NEW.Nombre
    );
    
    -- Verificar que pueda agregar un favorito
    IF favorite_count >= 10 THEN
        SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Usuario ya no puede agregar favoritos';
    END IF;
END
//

-- Trigger que limita el auido a castellano y
-- no pone subtitulos si la calidad de descarga es normal 
CREATE TRIGGER ajustar_descarga
BEFORE INSERT ON Descargar
FOR EACH ROW
BEGIN
    IF NEW.Calidad = 'normal' THEN
        SET NEW.SubtituloElejido = NULL;
        SET NEW.AudioElejido = 'Castellano';
    END IF;
END;

-- Trigger que limita a cuatro las horas de descarga para cada usuario asociado a una cuenta.
CREATE TRIGGER limit_horas_descarga
BEFORE INSERT ON dispositivo
FOR EACH ROW
BEGIN
    -- Calcular las HorasDescarga para el numero dado
    DECLARE total_horas DECIMAL(10,2);
    SET total_horas = COALESCE((SELECT SUM(HoraDescarga) FROM Dispositivo WHERE Nombre = NEW.Nombre), 0);

    -- Chequear si las horas totales de descarga supera 4
    IF total_horas + NEW.HoraDescarga > 4 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Exceeded the maximum limit of 4 HorasDescarga for the Nombre';
    END IF;
END;

-- Trigger que limita la cantidad de cuentas asociadas a un abono a tres. 
CREATE TRIGGER limitarCuentasAbono
BEFORE INSERT ON Paga
FOR EACH ROW
BEGIN
    -- Verficar si la cantidad de Mails asociados a un idOperacion es mayor a 3
    IF (SELECT COUNT(DISTINCT Mail) FROM Paga WHERE idOperacion = NEW.idOperacion) >= 3 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede tener mas de 3 cuentas asociadas a un abono';
    END IF;
END;
//

-- Trigger que actualiza la cantidad de cuenta asociadas a abono cada vez que se paga.
CREATE TRIGGER update_cantCuentas
AFTER INSERT ON Paga
FOR EACH ROW
BEGIN
    -- Actualizar cantCuentas del Abono correspondiente
    UPDATE Abono
    SET cantCuentas = (SELECT COUNT(DISTINCT Mail) FROM Paga WHERE idOperacion = NEW.idOperacion)
    WHERE idOperacion = NEW.idOperacion;
END;
//