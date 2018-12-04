Tfin=1; y0=[0;0.5];
[t,y]=ode45(@edof_ex2final1718,[0 Tfin],y0); 
figure(1), plot(t,y,'-o'), legend('y','dy/dx')
yFinalOde45=y(end,1);

%RK2
m=8; % #pasos
h=Tfin/m;
y=y0; Y=y; x=0;
for i=0:m-1
    xi=i*h;
    k1=edof_ex2final1718(xi,y);
    k2=edof_ex2final1718(xi+h,y+h*k1);
    y=y+h*(k1+k2)/2;
    Y=[Y,y]; x=[x,(i+1)*h];
end
hold on
figure(1), plot(x,Y,'-*'), legend('x','y')
hold off
    
errorRK2=(Y(1,end)-yFinalOde45)/yFinalOde45


