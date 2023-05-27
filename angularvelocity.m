clc
clear
close all
N=1800;
w=(2*pi*N)/60;
s= .14;
n=3.47;
mp=1.125;
mcr=1.75;
l1=.0744;
r=0.5*s;
mrec=mp+(((mcr)*(l1))/(r*n));
l=r*n;
t=[0:pi/12:4*pi];
fi=asin((1/n).*sin(t));
x=r.*cos(t)+l.*cos(fi);
Fi=mrec*w^2*r.*(cos(t)+(cos(2.*t)./n));
fg=xlsread('Fg_theta_data.xlsx','c5:c53');
Fg=fg';
jf=input('\n Enter moment of inertia of flywheel:')

Tg=x.*Fg.*tan(fi);
Ti=x.*Fi.*tan(fi);
T=Tg-Ti;
%% finding Tavg by trapezoidal rule
tav=(pi/24)*(T(1)+2*(sum(T(2:48)))+T(49));
Tav=tav/(4*pi);
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
%%
W=[w];
for i=2:1:49
    
    W=[W,sqrt((2/jf)*((pi/24)*(T(i)+T(i-1)-2*Tav))+(W(i-1))^2)];
end
    W
    plot(t,W)
xlabel('theta in radians');
ylabel('W in radians/sec');
title('Plot of W-theta values');

    
    
    
    
    
    
    
    
    
    
    