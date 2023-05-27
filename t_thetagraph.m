clc
clear
close all
N=input('\n Enter rpm of crank: ');
w=(2*pi*N)/60;
s=input('\n Enter stroke in meter: ');
n=input('\n Enter l/r: ');
mp=input('\n Enter mass of piston in kg: ');
mcr=input('\n Enter mass of connecting rod in kg: ');
l1=input('\n Enter c.g distance of connecting rod from crank pin end in meters: ');
r=0.5*s;
mrec=mp+(((mcr)*(l1))/(r*n));
l=r*n;
t=[0:pi/12:4*pi];
fi=asin((1/n).*sin(t));
x=r.*cos(t)+l.*cos(fi);
Fi=mrec*w^2*r.*(cos(t)+(cos(2.*t)./n));
fg=xlsread('Fg_theta_data.xlsx','c5:c53');
Fg=fg';

Tg=x.*Fg.*tan(fi);
Ti=x.*Fi.*tan(fi);
T=Tg-Ti
%% finding Tavg by trapezoidal rule
tav=(pi/24)*(T(1)+2*(sum(T(2:48)))+T(49))
Tav=tav/(4*pi)
%%finding intersection point
for i=1:49
    if (T(i)>Tav)
        flag(i)=1;
    else
        flag(i)=0;
    end
end
flag;
a=[];
for i=1:48
    if ((flag(i)>flag(i+1))|(flag(i)<flag(i+1)))
        a=[a,i];
    end
end
%% finding area under graph
area=[(pi/24)*(T(1)+2*(sum(T(2:a(1)-1)))+a(1))-(Tav.*(a(1))*(pi/12))];
for k=2:length(a)
    area=[area,(pi/24)*(T(1+a(k-1))+2*sum(T(2+a(k-1):a(k)-1))+T(a(k)))-(Tav*(a(k)-a(k-1))*(pi/12))];
end
KEmax=max(area)
Ks=input('\n Enter the value of Ks: ');
Jf=((KEmax)/(Ks*w^2))
%% plotting
plot(t,T,t,Tav,'r+-')
xlabel('theta in radians');
ylabel('T in N-m');
title('Plot of T-theta values');




 
    


