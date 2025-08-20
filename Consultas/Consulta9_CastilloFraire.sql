-- Consulta IX: Listar cuál es el contenido más visto en watchparty 
-- para segmento entre 14 y 19 años y entre 20 y 25 años.

-- Contenido mas popular en watchparty para segmento entre 14 y 19 años
(select c.TitOriginal, count(*) as WatchpartiesTotales
from watchparty as w
inner join contenido as c on w.idContenido = c.idContenido
inner join usuario as u1 on w.NomCreador = u1.Nombre
inner join usuario as u2 on w.NomParticipante = u2.Nombre
where (year(curdate()) - year(u1.FechaNac)) between 14 and 19
  and (year(curdate()) - year(u2.FechaNac)) between 14 and 19
GROUP BY c.TitOriginal
ORDER BY WatchpartiesTotales DESC
LIMIT 1 )

UNION ALL

-- Contenido mas popular en watchparty para segmento entre 20 y 25 años
(select c.TitOriginal, count(*) as WatchpartiesTotales
from watchparty as w
inner join contenido as c on w.idContenido = c.idContenido
inner join usuario as u1 on w.NomCreador = u1.Nombre
inner join usuario as u2 on w.NomParticipante = u2.Nombre
where (year(curdate()) - year(u1.FechaNac)) between 20 and 25
  and (year(curdate()) - year(u2.FechaNac)) between 20 and 25
GROUP BY c.TitOriginal
ORDER BY WatchpartiesTotales DESC
LIMIT 1)