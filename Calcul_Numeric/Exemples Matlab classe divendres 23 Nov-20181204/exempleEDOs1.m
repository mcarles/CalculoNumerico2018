Tfin=0.8;
[t,y]=ode45(@edof1,[0 Tfin],[0;1]); 
figure(1), plot(t,y,'-o'), legend('x','y')

%Euler
m=100; % #pasos
h=Tfin/m;
y=[0;1]; Y=y; x=0;
for i=0:m-1
    y=y+h*edof1(i*h,y);
    Y=[Y,y]; x=[x,(i+1)*h];
end
hold on
figure(1), plot(x,Y,'-*'), legend('x','y')
hold off
    


