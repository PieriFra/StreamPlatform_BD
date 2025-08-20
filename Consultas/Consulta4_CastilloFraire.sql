-- consulta IV: Listar las 5 series más vistas por los clientes de entre 25 y 35 años. 
select contenidoesserie.TitIngles, count(*) as CantVistas 
from usuario
inner join historial
on usuario.Nombre = historial.Nombre 
inner join contenidoesserie
on historial.idContenido = contenidoesserie.idContenido
where year(usuario.FechaNac) >= year('1988-01-01') and year(usuario.FechaNac) <= year('1998-01-01')
group by contenidoesserie.TitIngles
order by CantVistas desc
limit 5
