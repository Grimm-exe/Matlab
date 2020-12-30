function [P_C,P_N]=modo_prueba()

[P_C]=modo_calibrado(10);
hold on 
[P_N]=Matlab_Arduino(10);
end
%%%%%
%Muestro en pantall
%%%%%