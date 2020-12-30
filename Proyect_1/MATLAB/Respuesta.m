function [dato]=Respuesta()
Nombre_1 = {'Indique que eje desea graficar. 1=>Eje X, 2=>Eje Y, 3=>Eje Z'};
title = 'Pregunta al usuario';
num_lnes = 1; 
de = {''}; 
respuesta = inputdlg(Nombre_1,title,num_lnes,de);
dato=str2num(respuesta{1});
end