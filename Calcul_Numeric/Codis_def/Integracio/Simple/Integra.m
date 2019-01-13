function I = Integra(x, f, w, a, b)
    I = 0;
    for i = 1:length(x)
       %I = I + f( (x(i)-((b+a)/2))/((b-a)/2) ).*w(i); 
       I = I + f( (x(i)*((b-a)/2)) + (b+a)/2 ).*w(i); 
    end
    I = I*((b-a)/2);

end

