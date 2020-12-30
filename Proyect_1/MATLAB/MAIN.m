
%% 
clc
clear all
close all
global module       % Se especifica las subfunciones.
% Ventana de dialogo
prompt = {'Seleccione la version del codigo QR a anlizar:'};
dlg_title = 'Version';
num_lines = 1; %La respuesta consta de una sola linea
def = {'2'}; %Por definicion se encuentra en la version 2 de un codigo QR
answer = inputdlg(prompt,dlg_title,num_lines,def); %Se introduce las entradas
[version, ~] = str2num(answer{1}); %Se obtiene la version de QR a analizar
module=4*version+17;    % Formula para el numero de modulos(Formula General=4*(Version Number)+17)  
% [Icel]=Tomar_Foto
Im = imread('mat_img_3.jpg');     % Introdusimos la imagen de entrada
tic     % Start the timing process

%% ======================  ===========
% Se pregunta el analisis de posicion para un mejor acierto
choice = questdlg('Desea el analisis horizontal para la ubicacion de los AP?', ...
	'Validacion AP,Analisis horizontal', ...
	'Si','No','Si');
% Seleccion de la respuesta
switch choice
    case 'Si'

        AP_h_check = 1;
    case 'No'

        AP_h_check = 0;

end

%% ====================== =====
%Inicio de procesamiento del codigo Qr
[Msg,QR] = GetPattern_message_Fn(Im,AP_h_check); %Se usa la siguiente funcion para el analisis
% End the timing process
toc
