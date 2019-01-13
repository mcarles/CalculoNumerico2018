clear;     % Esborra variables i funcions de la memoria
close all; % Tanca totes les figures que hi ha obertes
clc        % Esborra les instruccions de la finestra de comandes 


%% Vectors fila
% Separem les components per , o espais en blanc
x1 = [1, 2, 3, 4]
x2 = [-1  4  3  -2];  % El ; al final de la instruccio suprimeix la resposta. 
                      % No veiem el resultat per pantalla, pero el vector esta en memoria 

                      
%% Vectors columna
% Separem les components per ; o salts de linia
v1 = [0; 2; 4; 8] 
v2 = [1
    -2
    -1
    0];  
% O podem trasposar un vector fila
v3 = x1' 


%% Vectors amb components equiespaiades
% component a component
z1 = zeros(1,100); 
for i = 1:100
    z1(i) = i; 
end
% fent servir l'operador : (colon) 
z2 = 1:100; 
z3 = 0:0.1:1
% o la instruccio linspace
z4 = linspace(0,1,11)

    
%% Matrius
a = [1,2; 3,4]


%% Matrius per blocs i com accedir-hi
A = [a, zeros(2,3); 2*ones(3,2), eye(3)]
% Si cal, mireu en l'ajuda del programa que fan les funcions zeros, ones, eye 
% ... per cert, matlab distingeix majuscules i minuscules (a,A)
A(2,4) % coeficient de la fila 2, columna 4 
A(3,:) % fila 3 de la matriu
A(3:5, 1:2) % submatriu formada per les columnes 1 i 2 de les files 3, 4 i 5
A([1,4], [2,5]) % submatriu 2x2 formada pels coeficients de les files 1 i 4, columnes 2 i 5
A([1,4], [2,5]) = [10,20; 30,40]
A(:,3) = -1


