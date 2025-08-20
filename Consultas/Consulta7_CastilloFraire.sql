-- Consulta VII: Calcular el monto total recaudado con los abonos en el mes actual.
-- Asumimos que el precio del abono es $5

select cant_abonos*5
from(
	select year(paga.FechaPago) as Ano, month(paga.FechaPago) as Mes, count(*) as cant_abonos
	from paga 
	where year(paga.FechaPago) = year(curdate()) and month(paga.FechaPago) = month(curdate())
	group by year(paga.FechaPago), month(paga.FechaPago)
) as PagosMes


-- con cuadrate no da porque queda desactualizado, podemos probar con el mes de abril 
/*
select cant_abonos*5
from(
	select year(paga.FechaPago) as Ano, month(paga.FechaPago) as Mes, count(*) as cant_abonos
	from paga 
	where year(paga.FechaPago) = year('2023-01-01') and month(paga.FechaPago) = month('2023-04-01')
	group by year(paga.FechaPago), month(paga.FechaPago)
) as PagosMes
*/