-- consulta V: Listar los documentales disponibles sobre COVID que hayan sido estrenados entre 2020 y 2022. 

select contenidoesdocumental.TitIngles
from contenidoesdocumental 
inner join documental 
on documental.TitIngles = contenidoesdocumental.TitIngles
inner join contenido
on contenidoesdocumental.idContenido = contenido.idContenido
where year(Contenido.Lanzamiento)>=2020 and year(Contenido.Lanzamiento)<=2022 and Documental.tema like '%COVID%'