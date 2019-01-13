function [x,Y] = DifCent(f,I,vi,n)
    x = linspace(I(1),I(2),n);
    h = x(2) - x(1);
    Y = vi;
    Y1 = Y + h*f(x(1),Y);
    Y = [Y, Y1];
    for i = 3:n
       Yi = Y(:,end);
       Yimenys1 = Y(:,end-1);
       Yim1 = Yimenys1 + 2*h*f(x(i),Yi);
       Y = [Y, Yim1];
    end
end

