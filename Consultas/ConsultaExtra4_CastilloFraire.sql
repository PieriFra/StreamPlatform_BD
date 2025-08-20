-- Consulta Extra IV: Listar las series que no fueron 
-- populares globalmente y no han sido vistas en los ultimos 5 meses

select contenidoesserie.titIngles
from contenidoesserie
inner join serie on contenidoesserie.titIngles = serie.titIngles
where contenidoesserie.idContenido not in
(
  select contenidoesserie.idContenido
  from contenidoesserie
  inner join reproduce on contenidoesserie.idContenido = reproduce.idContenido
  where reproduce.Fecha >= date_sub(curdate(), interval 5 month) 
) 
and serie.Calificacion like 'no me gusto'