-- consulta X: Listar el top 10 de marcas de televisores usados para casting.

SELECT dispositivo.Marca, count(*) AS cant_dispositivos
FROM dispositivo INNER JOIN castea
ON dispositivo.idDispositivo = castea.idCastea
where Dispositivo.tipo LIKE 'TV'
GROUP BY dispositivo.Marca, dispositivo.Tipo
ORDER BY cant_dispositivos DESC
limit 10