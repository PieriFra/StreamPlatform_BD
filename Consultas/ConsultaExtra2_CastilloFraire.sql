
-- Consulta Extra II: listar los contenidos que nunca fueron reproducidos
SELECT c.idContenido, c.TitOriginal
FROM contenido as c
LEFT JOIN reproduce as r ON c.idContenido = r.idContenido
WHERE r.idContenido IS NULL;
