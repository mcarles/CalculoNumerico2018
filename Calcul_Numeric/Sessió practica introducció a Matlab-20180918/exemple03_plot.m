clear;     % Esborra variables i funcions de la memoria
close all; % Tanca totes les figures que hi ha obertes
clc        % Esborra les instruccions de la finestra de comandes 

%%
%----------------------------------------------------------------------
% Dibuix de la funcio sin(pi*x), per x entre -1 i 1
%----------------------------------------------------------------------
% Vector amb les coordenades horitzontals dels punts que volem dibuixar
x1 = linspace(-1,1); 
% Vector amb les coordenades verticals dels punts que volem dibuixar
y1 = sin(pi*x1); 

figure; % Obre una figura nova
plot(x1,y1) 

figure; 
% Ara canviem el color, el tipus i el gruix de linia (ara es vermella,
% discontinua i mes gruixuda)
plot(x1,y1,'r--', 'LineWidth',3)
% Afegim la quadricula dels eixos
grid on 
% Canviem la grandaria de la font dels eixos
set(gca,'FontSize',16) 


%% 
%----------------------------------------------------------------------
% Dibuix de les funcions sin(pi*x) i cos(pi*x), per x entre -1 i 1
%----------------------------------------------------------------------
y2 = cos(pi*x1); 

figure; 
plot(x1,y1, x1,y2)
lg = legend('sin', 'cos'); 

figure; 
% Dibuixem la funcio sinus en color negre, marcadors * i linia de punts
plot(x1,y1,'k*:')
hold on
% Dibuixem la funcio cosinus en color blau i linia discontinua mes gruixuda
plot(x1,y2,'b--','LineWidth',2)
lg = legend('sin', 'cos'); 
% Fem la lletra de la llegenda mes gran i la col.loquem a la cantonada NW
set(lg,'FontSize',16','Location','NorthWest')


