m = 8;
x = linspace(-1,1, 101);

rx = linspace(-1,1, 101);
ry = F(rx);
figure
plot(rx, ry, 'r-')
hold on;
labels = ['Funcion Runge'];


MChev = mat_leg(m, -1, 1);
TIChev = TI_leg(m, -1, 1, @F);

C = MChev\TIChev;

C = fliplr(C');

Y = polyval(C, x);

plot(x, Y, '-')

hold on