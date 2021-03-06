close all; clear; clc
% CALCUL I DIBUIX D'SPLINES
% Aquest script calcula i dibuixa l'Spline cubic C1 amb aproximaci? de les
% derivades, per als punts base i valors de la funcio a x i y.
%
% EXERCICIS:
% (1) Mira l'ajuda i el codi de la funcio dibuixaSplineCubic per veure que fa.
% (2) Implementa una funcio amb cap?alera 
%        function d2S = calculaCurvaturesSplineNatural(x,y)
%     que donats x i y, calculi les curvatures als punts base corresponents
%     a l'Spline natural. Descomenta les linies corresponents a l'Spline
%     natural a aquest codi. Observa els dos Splines. Son raonables els
%     resultats?
% (3) Implementa l'Spline C1 parabolic fent una aproximaci? de la derivada
%     per al primer punt. Dibuixa l'aproximaci? obtinguda.
% (4) Per a cada un dels Splines dibuixa (i) l'aproximaci? amb les dades
%     donades i (ii) modificant el valor del 3er punt de 1 a 2. Observa
%     on i quant afecta la modificaci? del valor en cada cas.
% (5) Dibuixa la base de cada un dels Splines. Es una base local? Explica
%     aix? el comportament dels Spline a l'apartat anterior?
%     (Pot ser util la funcio subplot)

%Dades
x = [0,1,3,4,5,7]; y = [1,1.25,1,0.5,0,0.4];
%x = [0,1,3,4,5,7]; y = [1,1.25,2,0.5,0,0.4];

%Spline C1 cubic amb aproximacio de les derivades
i = 2:length(x)-1;
dS = [ (y(2)-y(1))/(x(2)-x(1)) (y(i-1)-y(i+1))./(x(i-1)-x(i+1)) (y(end)-y(end-1))/(x(end)-x(end-1))]
[xS1,yS1,coeficients]=dibuixaSplineCubic(x,y,dS,[]);
coeficients
figure(1)
plot(xS1,yS1,'r-',x,y,'ko','LineWidth',2)
legend('C1 cubic')
grid on;

%Spline natural
d2S = calculaCurvaturesSplineNatural(x,y)
[xS2,yS2,coeficients]=dibuixaSplineCubic(x,y,[],d2S);
coeficients
figure(1)
plot(xS1,yS1,'r-',xS2,yS2,'b-',x,y,'ko','LineWidth',2)
legend('C1 cubic','Natural')
grid on;

% Spline parabolic C1 (recurrent)
[xS3,yS3,coeficients]=dibuixaSplineC1Parabolic(x,y);
coeficients
figure(1)
plot(xS1,yS1,'r-',xS2,yS2,'b-',xS3,yS3,'g-',x,y,'ko','LineWidth',2)
legend('C1 cubic','Natural','parabolic')
grid on;

%Base de les Splines C1 cubiques
figure(2)
for i=1:length(x)
x1= [1:length(x)]; y1 = zeros(length(x)); y1(i) = 1;
dS = zeros(length(x));
[xS1,yS1,coeficients]=dibuixaSplineCubic(x1,y1,dS,[]);
subplot(length(x),2,i), plot(xS1,yS1,'r-',x1,y1,'ko','LineWidth',2)
title(['C1: b', num2str(i)])
grid on;
end
for i=1:length(x)
x1= [1:length(x)]; y1 = zeros(length(x));
dS = zeros(length(x)); dS(i) = 1;
[xS1,yS1,coeficients]=dibuixaSplineCubic(x1,y1,dS,[]);
subplot(length(x),2,i+length(x)), plot(xS1,yS1,'r-',x1,y1,'ko','LineWidth',2)
title(['C1: B', num2str(i)])
grid on;
end

%Base de les Splines naturals
figure(3)
for i=1:length(x)
x1= [1:length(x)]; y1 = zeros(length(x)); y1(i) = 1;
d2S = zeros(length(x));
[xS2,yS2,coeficients]=dibuixaSplineCubic(x1,y1,[],d2S);
subplot(length(x),2,i), plot(xS2,yS2,'r-',x1,y1,'ko','LineWidth',2)
title(['C2: b', num2str(i)])
grid on;
end
for i=1:length(x)
x1= [1:length(x)]; y1 = zeros(length(x));
d2S = zeros(length(x)); d2S(i) = 1;
[xS2,yS2,coeficients]=dibuixaSplineCubic(x1,y1,[],d2S);
subplot(length(x),2,i+length(x)), plot(xS2,yS2,'r-',x1,y1,'ko','LineWidth',2)
title(['C2: B', num2str(i)])
grid on;
end

%Base de les splines Paraboliques
figure(4)
for i=1:length(x)
x1= [1:length(x)]; y1 = zeros(length(x)); y1(i) = 1;
[xS3,yS3,coeficients]=dibuixaSplineC1Parabolic(x1,y1);
subplot(length(x),1,i), plot(xS3,yS3,'r-',x1,y1,'ko','LineWidth',2)
title(['Paraboliques: b', num2str(i)])
grid on;
end


