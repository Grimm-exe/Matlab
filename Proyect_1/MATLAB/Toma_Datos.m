function [Valores_Obtenidos]=Toma_Datos(numero_muestras)
for i=1:numero_muestras
Voltaje(i) = input('Ingrese el voltaje del sensor en Voltios')
Resistencia(i)=input('Ingrese la resistencia del sensor')
Corriente(i) =Voltaje(i)/Resistencia(i);
end
'Voltaje en Voltios/Resistencia en KoHMS/Corriente en mA'
Valores_Obtenidos=[Voltaje' Resistencia' Corriente'];
end