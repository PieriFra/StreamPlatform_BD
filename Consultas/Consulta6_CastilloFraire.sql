-- consulta VI: Listar los usuarios y sus perfiles que vieron durante el año 2023, la serie “GAME OF THRONES”. 
-- indicar cuantos la vieron en idioma original y cuanto en castellano
    
select historialGOT.Audio, count(historialGOT.Audio) as CantVistas
from(
  select historial.Nombre, historial.Audio 
  from contenido
  inner join historial
  on contenido.idContenido = historial.idContenido
  where contenido.TitOriginal like 'GAME OF THRONES' and year(historial.Fecha) = 2023
  ) as historialGOT 
where historialGOT.Audio like 'Castellano' and historialGOT.Audio like 'Original'
group by historialGOT.Audio

