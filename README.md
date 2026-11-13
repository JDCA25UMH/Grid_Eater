<h1>Grid Eater Demo</h1>
Demo consistente en dos cuadros, cuales se mueven de diferentes formas dentro de un espacio determinado 
en una pantalla, rodeada por un límite verde, cual no pueden pasar, a costa de cambiar el estado del juego 
de "juego" a "ended".



<p align="center">
<img width="500" height="360" alt="Captura de pantalla 2026-11-12 191950" 
  src="https://github.com/user-attachments/assets/f6a2f73f-8cdf-44e2-a4ea-46ab15f136be" /><br>
</p>

  
El rectangulo de color azul claro se mueve por medio de las indicaciones del usuario de acuerdo a un 
metodo :move(), asignado al objeto ```lua local grid_real```, el cual establece una relación por medio de colisiones 
con un objeto que aparece de forma aleatoria, frente al tiempo del juego, haciendo desapareceral segundo objeto, 
el cuadro de color naranja, y colisiona con el primer cuadro, acorde con la siguiente función:
```lua


local function collision(gx,gy,gw,gh,
px,py,pw,ph)
if gx +gw>px and
gx<px+pw and
gy+gh>py and
gy<py+ph then
return true
else
return false
end
end

```
  
Por medio de las colisiones, desaparece el segundo objeto, y se suman puntos en el juego, a no ser que el 
usuario active la mencionada acción consecuente al estado "ended".
