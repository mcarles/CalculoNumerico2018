function I = Integra(x, f, w)
    I = 0;
    for i = 1:length(x)
       I = I + f(x(i)).*w(i); 
    end
end

