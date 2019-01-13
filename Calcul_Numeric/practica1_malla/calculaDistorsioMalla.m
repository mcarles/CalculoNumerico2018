function distorsioMalla = calculaDistorsioMalla(X,T)
% distorsioMalla = calculaDistorsioMalla(X,T)
%Matriu que ve a l'exercici que serveix per calcular la distorsio d'un
%triangle
A = [
    1  -sqrt(3)/3
    0   2*sqrt(3)/3
    ];
res = 0; %variable on anirà el resultat del sumatori
[n,m] = size(T); %Prenc el nº de files de la matriu T (n) per saber la longitud del for
for i = 1:n
    Xi = X(T(i,:),:); 
    Dfi = [Xi(2,:)-Xi(1,:); Xi(3,:)-Xi(1,:)]'*A;
    NDfi = norm(Dfi, 'fro'); %Norma de frobenius de la matriu Dfi
    res = res + (NDfi.^2/(2*abs(det(Dfi)))).^2; %La suma és de totes les distors petites al quadrat
end

distorsioMalla = sqrt(res);
end

