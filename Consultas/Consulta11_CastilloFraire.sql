-- Listar los contenidos más abandonados, separados por película, serie y documental.

SELECT count(contenido.TitOriginal) as Cant, contenido.TitOriginal,
       CASE
           WHEN contenidoespelicula.TitIngles IS NOT NULL THEN 'Pelicula'
           WHEN contenidoesserie.TitIngles IS NOT NULL THEN 'Serie'
           WHEN contenidoesdocumental.TitIngles IS NOT NULL THEN 'Documental'
       END AS TipoContenido
FROM reproduce
LEFT JOIN contenidoespelicula ON reproduce.idContenido = contenidoespelicula.idContenido
LEFT JOIN contenidoesserie ON reproduce.idContenido = contenidoesserie.idContenido
LEFT JOIN contenidoesdocumental ON reproduce.idContenido = contenidoesdocumental.idContenido
INNER JOIN contenido ON contenido.idContenido = reproduce.idContenido
GROUP BY contenido.TitOriginal, TipoContenido
ORDER BY Cant desc