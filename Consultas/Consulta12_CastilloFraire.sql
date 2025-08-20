
-- Consulta XII: Indicar cuál es el actor estelar más buscado por los usuarios.

select realiza_busqueda.Descripcion,  count(realiza_busqueda.Descripcion) as Cant
from realiza_busqueda
where realiza_busqueda.Tema like 'actor'
group by realiza_busqueda.Descripcion
ORDER BY Cant desc
LIMIT 1
