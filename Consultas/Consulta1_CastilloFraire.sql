-- consulta I: Listar todas las películas que tengan audio en español.
select
  contenidoespelicula.idContenido,
  contenidoespelicula.TitIngles,
  audio.Audio
from contenidoespelicula inner join audio on contenidoespelicula.idContenido = audio.idContenido
where audio.Audio like 'castellano'
