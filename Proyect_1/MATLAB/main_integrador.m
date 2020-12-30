clc,clear all,close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Nombre = {'Que accion desea realizar?(Prueba o medicion)'};
Titulo = 'Pregunta al usuario';
num_lines = 1; 
def = {''}; 
answer = inputdlg(Nombre,Titulo,num_lines,def);
Medicion=size(char(answer),2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
switch Medicion
    case 6
        
        [Eror_Calibrado,Eror_Normal]=modo_prueba()
       
    case 8
      
        medicion();
end

