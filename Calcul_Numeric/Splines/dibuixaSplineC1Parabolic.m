function [xS3,yS3,coeficients]=dibuixaSplineC1Parabolic(x,y)
h=x(2:end)-x(1:end-1);
t=y(2:end)-y(1:end-1);

fp0  = t(1)/h(1);

xS3 = []; yS3 = []; coeficients = [];
x01 = [0:1/20:1]; %20 subintervals a cada interval

for i=1:length(x)-1
    b = fp0;
    a = (t(i)-fp0*h(i))/(h(i).^2);
    c = y(i);
    
    fp0 = 2*a*h(i) + b;

    xs = x(i)+x01*h(i); %valors de x a l'interval
    ys = a*(xs-x(i)).^2 + b*(xs-x(i)) + c;
    xS3 = [xS3 xs]; yS3 = [yS3 ys]; coeficients=[coeficients; a b c];
end

end

