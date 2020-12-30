
function [Error_Normal]=Matlab_Arduino(numero_muestras)

close all;
clc;
y=zeros(1,1000); %Vector donde se guardarán los datos

%Inicializo el puerto serial que utilizaré
delete(instrfind({'Port'},{'COM5'}));
puerto_serial=serial('COM5');
puerto_serial.BaudRate=9600;
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');

%Abro el puerto serial
fopen(puerto_serial); 

%Declaro un contador del número de muestras ya tomadas
contador_muestras=1;
V=[];
h=1;
%Creo una ventana para la gráfica
figure('Name','Fuerza obtenida ')
title('Fuerza obtenida en el sensor FSR');
xlabel('Número de muestra');
ylabel('Fuerza en el sensor FSR ');
grid on;
hold on;

%Bucle while para que tome y dibuje las muestras que queremos
while contador_muestras<=numero_muestras
       ylim([0 150]); 
        xlim([contador_muestras-20 contador_muestras+5]);
        Valor_analogico=fscanf(puerto_serial,'%d');
        Voltaje=((5*Valor_analogico(1))/1024)*1000;
        Resistencia_FSR=((5000-Voltaje(1))*10000)/Voltaje;
        Conductancia=1000000/Resistencia_FSR(1);
        Fuerza=(Conductancia(1)/80)*0.101972*1000
        V=[V Fuerza]

%         valor_fuerza=fscanf(puerto_serial,'%d')'
         valor=(Fuerza(1));
        y(contador_muestras)=valor;
        plot(contador_muestras,y(contador_muestras),'X--r');        
        drawnow
        contador_muestras=contador_muestras+1;
        %valor_potenciometro(1,contador_muestras)=fscanf(puerto_serial,'%d')'       
        
       
        
end
Promedio_Normal=sum(V)/numero_muestras
Error_Normal=((100-Promedio_Normal)/100)*100
%Cierro la conexión con el puerto serial y elimino las variables
%  while i<=numero_muestras-1
%      ylim([0 100]); 
%         xlim([i-20 i+5]);
%      ADCH(1,i+1)=valor_potenciometro(1,3*i+2);
%      ADCL(1,i+1)=valor_potenciometro(1,3*i+3) ;    
%  Fuerza=(log(1.2186-(0.448*ADCL)-(0.00175*ADCH))/-0.0037)+1
%  
%         y=Fuerza;
%         plot(h,y(h),'X-r');        
%         drawnow
%         i=i+1;
%         h=h+1;
%  end
fclose(puerto_serial); 
delete(puerto_serial);


end