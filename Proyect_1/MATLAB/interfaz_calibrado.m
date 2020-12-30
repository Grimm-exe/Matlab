function [N]=interfaz_calibrado()
Nombre = {'Que medicion va a realizar ?'};
Titulo = 'Pregunta al usuario';
num_lines = 1; 
def = {''}; 
answer = inputdlg(Nombre,Titulo,num_lines,def);
Medicion=size(char(answer),2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
switch Medicion
    case 6
        
        modo_calibrado(pregunta());
        
        'Fuerza'
    case 7
      
        Presion_calibrado(pregunta());
        'Presion'
    case 11
        acelerometro_arduino();
        'Aceleracion'
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
