-- consulta III: Ver los dispositivos que tiene vinculado un determinado usuario. 
select 
  usuario_posee_dispositivo.Nombre,
  dispositivo.idDispositivo,
  dispositivo.Nombre
from usuario_posee_dispositivo 
inner join dispositivo 
on usuario_posee_dispositivo.idDispositivo = dispositivo.idDispositivo
where usuario_posee_dispositivo.Nombre like 'Beatrice Watterson'