
-- Consulta Extra I: listar todas las peliculas que tienen todos los audios disponibles.

select contenidoespelicula.TitIngles, count(contenidoespelicula.TitIngles) as CantAudios
from contenidoespelicula
inner join audio on contenidoespelicula.idContenido = audio.idContenido
group by contenidoespelicula.TitIngles
having count(contenidoespelicula.TitIngles) = 3;