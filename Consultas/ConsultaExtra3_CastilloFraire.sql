
-- Consulta Extra III: Mostrar todos los usuarios que hayan visto mas de 3 contenidos
-- vistos = terminados -> historial

select distinct CantReproducidos.Nombre
from
(
	select h.Nombre, count(*) as CantContenido
	from historial as h
	group by h.Nombre
) as CantReproducidos
where CantContenido >= 3