close all; clear; clc;
% Objectius:
% - Entendre els conceptes basics dels metodes per a la resolucio numerica
% d'EDOs.
% - Implementar un metode per resoldre EDOs (metode d'Euler)
% - Comprovar experimentalment la convergencia d'un metode
%
% Tasques a fer:
% 1) Executar i mirar aquest script per veure com es pot resoldre el 
%    problema de valor inicial (PVI) amb la funcio de Matlab ode45
% 2) Implementar el metode d'Euler per a la resolucio del mateix PVI
%    Cal crear la funcio Euler amb els arguments d'entrada i sortida
%    especificats a aquest script. 
% 3) Dibuixar una grafica de log10(abs(error)) en funcio de log10(h), on l'error
%    s'evalua com la diferencia entre la solucio analitica i la solucio
%    numerica per x=2. Comprovar si l'ordre de convergencia coincideix amb
%    el teoric.
% Es proposa ara resoldre el PVI y''= -y, y(0)=1, y'(0)=0 per x en (0,T)
% 4) Reduir la EDO de segon ordre a un sistema d'EDOs de 1er ordre
%    Resoldre numericament el PVI amb el metode d'Euler per T=2*pi. Comprovar
%    la converg?ncia.
% 5) Amb h=0.01 resoldre el problema per T=10*pi,50*pi. ?s el m?tode
%    (absolutament) estable? 


% Resolucio de la EDO dy/dx = -y/(10x+1) per x en (0,1) 
% amb condicio inicial y(0)=1
f=@(x,y) -y/(10*x+1); a=0; b=1;  y0=1;

%Solucio amb funcions intrinseques de Matlab
[x,Y]=ode45(f,[a,b],y0);
figure(1), plot(x,Y,'-*'), title('ode45')
hold on;

[x1,Y1] = Euler(f,[a,b],y0,50);
plot(x1,Y1,'r-*'), title('Euler')
hold on;
%Solucio amb el metode d'Euler
h=0.1;
npassos=ceil((b-a)/h); 
[x,Y]=Euler(f,[a,b],y0,npassos); 
plot(x,Y,'-*g'), title('Euler')

a=0; b=2; y0=1; pas = 0.1;
[x,Y]=ode45(f,[a,b],y0);
vanalitic = Y(length(Y));
err = [];
H = [];
h = (b-a)-pas;
while(h > 0)
    H = [H, h];
    npassos=ceil((b-a)/h);
    [x1,Y1]=Euler(f,[a,b],y0,npassos);
    err = [err, abs(vanalitic - Y1(npassos))];
    h = h - pas;
end

figure(2), plot(-log(H), log(err), '*-');

%La segona edo
g1 = @(x,y) 0;
g2 = @(x,z) -y;
