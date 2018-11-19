function [S,nint] = IntAdapt(f,a,b,tol,n)
    %Calculo de las Ss del enunciado usando Simpson Simple.
    S1 = SimpsonSimple(f,a,b);
    S2 = SimpsonSimple(f,a,(a+b)/2);
    S3 = SimpsonSimple(f,(a+b)/2,b);
    
    %Calculo del error
    Eab = abs(S1 - (S2 + S3));
    if (Eab < tol*(b-a))
       %Si has aproximado bien, acaba y devuelve
       S = S1;
       nint = n;
       return;
    else
       %Llamada recursiva, como metes 2 intervalos nuevos por llamada se
       %suma 2 al numero de intervalos
       n = n + 2;
       nint = n;
       S = IntAdapt(f,(a+b)/2,b,tol,n) + IntAdapt(f,a,(a+b)/2,tol,n);
    end
end

