function [S, x] = Test(f,a,b,tol,pts)
    %Calculo de las Ss del enunciado usando Simpson Simple.
    S1 = SimpsonSimple(f,a,b);
    S2 = SimpsonSimple(f,a,(a+b)/2);
    S3 = SimpsonSimple(f,(a+b)/2,b);
    x = pts;
    %Calculo del error
    Eab = abs(S1 - (S2 + S3));
    
    if (Eab < tol*(b-a))
       %Si has aproximado bien, acaba y devuelve
       S = S1;
       x = [pts, a, b];
       return;
    else
       [Sa, xa] = Test(f, (a+b)/2, b, tol, pts);
       [Sb, xb] = Test(f, a, (a+b)/2, tol, pts);
       x = [xa, xb];
       S = Sa + Sb;
    end
end