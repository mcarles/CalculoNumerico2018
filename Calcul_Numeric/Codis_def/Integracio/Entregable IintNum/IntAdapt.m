function [S, nint, x] = IntAdapt(f,a,b,tol,n, pts)
    %Calculo de las Ss del enunciado usando Simpson Simple.
    S1 = SimpsonSimple(f,a,b);
    S2 = SimpsonSimple(f,a,(a+b)/2);
    S3 = SimpsonSimple(f,(a+b)/2,b);
    nint = n;
    x = pts;
    %Calculo del error
    Eab = abs(S1 - (S2 + S3));
    
    if (Eab < tol*(b-a))
       %Si has aproximado bien, acaba y devuelve
       S = S1;
       x = [pts, a, b];
       return;
    else
       %Llamada recursiva, como metes 2 intervalos nuevos por llamada se
       %suma 2 al numero de intervalos
       nint = nint + 1;
       
       [Sa, ninta, xa] = IntAdapt(f, (a+b)/2, b, tol, nint, pts);
       [Sb, nintb, xb] = IntAdapt(f, a, (a+b)/2, tol, nint, pts);
       x = [xa, xb];
       
       S = Sa + Sb;
       nint = max(ninta,nintb);
    end

end

