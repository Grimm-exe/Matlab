function [Muestras]=pregunta()
Nombre_1 = {'Cuantas muestras desea realizar'};
title = 'Pregunta al usuario';
num_lnes = 1; 
de = {''}; 
respuesta = inputdlg(Nombre_1,title,num_lnes,de);
Muestras=str2num(respuesta{1});
end