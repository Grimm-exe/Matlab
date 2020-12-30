function [Vector_ADC]=Acelerometro(numero_muestras)
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
Vector_A=[];
h=1;
%Creo una ventana para la gráfica
figure('Name','Fuerza obtenida ')
title('Fuerza obtenida en el sensor FSR');
xlabel('Número de muestra');
ylabel('Fuerza en el sensor FSR ');
grid on;
hold on;
while contador_muestras<=numero_muestras*3
        Valor_analogico=fscanf(puerto_serial,'%d');
        Vector_A=[Vector_A Valor_analogico]
       contador_muestras=contador_muestras+1;       
end  
a=Respuesta()  %Funcion
switch a
    case 1
        
            for i=0:numero_muestras-1
                Eje_X(1,:)=Vector_A(3*i+1)
            end
            while contador_muestras<=numero_muestras
             ylim([0 150]); 
             xlim([contador_muestras-20 contador_muestras+5]);
             valor=Eje_X(1);
            y(contador_muestras)=valor;
             plot(contador_muestras,y(contador_muestras),'X--r');        
        drawnow
        contador_muestras=contador_muestras+1;
            end
    
    case 2
            for i=0:numero_muestras-1
                Eje_Y(1,:)=Vector_A(3*i+2)
            end
            while contador_muestras<=numero_muestras
             ylim([0 150]); 
             xlim([contador_muestras-20 contador_muestras+5]);
             valor=Eje_Y(1);
            y(contador_muestras)=valor;
             plot(contador_muestras,y(contador_muestras),'X--r');        
        drawnow
        contador_muestras=contador_muestras+1;
            end
        
    case 3
        for i=0:numero_muestras-1
            Eje_Z(1,:)=Vector_A(3*i+3)
        end
        while contador_muestras<=numero_muestras
             ylim([0 150]); 
             xlim([contador_muestras-20 contador_muestras+5]);
             valor=Eje_Z(1);
            y(contador_muestras)=valor;
             plot(contador_muestras,y(contador_muestras),'X--r');        
        drawnow
        contador_muestras=contador_muestras+1;
        end
end       
