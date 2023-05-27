% RK-4 method applied to solve vibration problem with viscous damping
clear all 
clc
x0=1.0; y0=0; k=1.0; m=1.0; c=0.2; dt=0.1; w=0.3; t0=0.0; a=0;
for i=1:2000
    x1=x0; y1=y0; t1=t0;
    g1=(1/m)*(a*sin(w*t1)-k*x1-c*y1);
    f1=y1;
    x2=x0+(dt/2)*f1; y2=y0+(dt/2)*g1; t2=t1+(dt/2); 
    f2=y2;
    g2=(1/m)*(a*sin(w*t2)-k*x2-c*y2);
    x3=x0+(dt/2)*f2; y3=y0+(dt/2)*g1; t3=t2;
    f3=y3;
    g3=(1/m)*(a*sin(w*t3)-k*x3-c*y3);
    x4=x0+dt*f3; y4=y0+dt*g3; t4=t1+dt;
    f4=y4;
    g4=(1/m)*(a*sin(w*t4)-k*x4-c*y4);
    
    x(i+1)=x0+dt*(f1+2*f2+2*f3+f4)/6;
    y(i+1)=y0+dt*(g1+2*g2+2*g3+g4)/6;
    t(i+1)= t1+dt;
    
    t0=t1+dt; x0=x(i+1); y0=y(i+1);
end
plot(t,x)
  