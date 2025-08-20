-- Consulta VIII: Mostrar las cuentas que no pagaron el mes actual, y
-- han usado el servicio en algún momento, durante los dos días anteriores a la consulta.

select paga.mail
from paga
inner join usuario_tiene_cuenta on paga.mail = usuario_tiene_cuenta.mail
inner join reproduce on usuario_tiene_cuenta.Nombre = reproduce.Nombre
left join abono on paga.idOperacion = abono.idOperacion
where paga.idOperacion is null and month(abono.FechaFac) = month(curdate()) 
and reproduce.Fecha >= date_sub(curdate(), interval 2 day)