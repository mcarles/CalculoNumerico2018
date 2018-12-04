function shootError=ex2final1718_shoot(beta)
Tfin=1; y0=[0;beta];
[t,y]=ode45(@edof_ex2final1718,[0 Tfin],y0); 
%figure(1), plot(t,y(:,1),'-o'), legend('u')
shootError=y(end,1)-0; %darrer pas, primera component

