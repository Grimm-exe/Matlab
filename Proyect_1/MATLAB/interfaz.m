function [m]=interfaz()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Nombre = {'Que medicion va a realizar ?'};
Titulo = 'Pregunta al usuario';
num_lines = 1; 
def = {''}; 
answer = inputdlg(Nombre,Titulo,num_lines,def);
Medicion=size(char(answer),2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
switch Medicion
    case 6
        
        Matlab_Arduino(pregunta());
        
        'Fuerza'
    case 7
      
        Presion_Arduino(pregunta());
        'Presion'
    case 11
        acelerometro_arduino();
        'Aceleracion'
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
