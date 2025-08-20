-- consulta II: Mostrar cuál es la película más vista de la plataforma por cada mes de los últimos seis. 

select contenidoespelicula.TitIngles, count(*) as Vistas, month(historial.Fecha) as Mes
from contenidoespelicula
inner join historial
on contenidoespelicula.idContenido = historial.idContenido
where month(curdate()) - month(historial.fecha) <= 6 and year(historial.fecha) = year(curdate())
group by month(historial.Fecha), contenidoespelicula.TitIngles
order by vistas desc
limit 5