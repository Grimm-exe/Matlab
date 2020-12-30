function [Error_Cali]=modo_calibrado(numero_muestras)
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
calibrado=[];
i=0;
%Creo una ventana para la gráfica
figure('Name','Fuerza obtenida ')
title('Fuerza obtenida en el sensor FSR');
xlabel('Número de muestra');
ylabel('Fuerza en el sensor FSR ');
grid on;
hold on;
%%%%%%%%%%%%%%%%%
pesos=[0 10 20 50 100 150 200]
masas=[0 30 60 100 350 700 1800]
p1=polyfit(masas,pesos,2)
%%%%%%%%%%%%%%%%%
while contador_muestras<=numero_muestras
    ylim([0 150]); 
    xlim([contador_muestras-20 contador_muestras+5]);
voltaje_analogico=fscanf(puerto_serial,'%d');
masa_calibrada=polyval(p1,voltaje_analogico(1))
calibrado=[calibrado masa_calibrada]
valor=(masa_calibrada(1))
        y(contador_muestras)=valor;
        plot(contador_muestras,y(contador_muestras),'X--r')       
        drawnow
        contador_muestras=contador_muestras+1;
end
Promedio=sum(calibrado)/numero_muestras-5
Error_Cali=((100-Promedio)/100)*100
end