function Presion_Arduino(numero_muestras)

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
i=0;
h=1;
V=[];
%Creo una ventana para la gráfica
figure('Name','Presion obtenida ')
title('Presion obtenida en el sensor FSR');
xlabel('Número de muestra');
ylabel('Presion en el sensor FSR ');
grid on;
hold on;

%Bucle while para que tome y dibuje las muestras que queremos
while contador_muestras<=numero_muestras
       ylim([0 5]); 
        xlim([contador_muestras-20 contador_muestras+5]);
        Valor_analogico=fscanf(puerto_serial,'%d');
        Voltaje=((5*Valor_analogico(1))/1024)*1000;
        Resistencia_FSR=((5000-Voltaje(1))*10000)/Voltaje;
        Conductancia=1000000/Resistencia_FSR(1);
        Fuerza=(Conductancia(1)/80)*0.101972*1000;
 
        Fuerza_Newtons=Fuerza/101.972;
        Presion=Fuerza_Newtons*1.45
        V=[V Presion];
        valor=Presion(1);
        y(contador_muestras)=valor;
        plot(contador_muestras,y(contador_muestras),'X--r');        
        drawnow
        contador_muestras=contador_muestras+1;
 end
%Promedio=sum(V)/numero_muestras-5
%Error=((Promedio-1.421)/1.421)*100
%Cierro la conexión con el puerto serial y elimino las variables
fclose(puerto_serial); 
delete(puerto_serial);
clear all;

end