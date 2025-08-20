
-- Consulta Extra V: Mostrar que genero fue el mas buscado

select realiza_busqueda.Descripcion, count(realiza_busqueda.Descripcion) as cantBusqueda
from realiza_busqueda
where realiza_busqueda.Tema like 'Genero'
group by realiza_busqueda.Descripcion
order by cantBusqueda desc
limit 1