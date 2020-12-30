function [nada]=medicion()
Nombre = {'Indique el modo a trabajar ?(Calibrado o Normal)'};
Titulo = 'Pregunta al usuario';
num_lines = 1; 
def = {''}; 
answer = inputdlg(Nombre,Titulo,num_lines,def);
Res=size(char(answer),2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
switch Res
    case 9
        
        interfaz_calibrado();
        
  
    case 6
      
        interfaz();
end
end
