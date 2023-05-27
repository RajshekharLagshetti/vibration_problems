clc
clear all
M=[4,0,0;0,2,0;0,0,1]
K=[4,-1,0;-1,2,-1;0,-1,1]
X1=ones(3,1);
D=K\M;
del1=ones(3,1);
del2=ones(3,1);
del3=ones(3,1);
i=0;
while ((norm(del1,'fro'))>0.0001)
    A=(D*X1);
    newX1=A/A(1);
    del1=newX1-X1;
    X1=newX1;
    i=i+1;
end
w1=sqrt(1/A(1));
j=0;
X1=ones(3,1);
S1=((eye(3))-((newX1*(newX1)'*M)/((newX1)'*M*newX1)));
while ((norm(del2,'fro'))>0.001)
    A=(D*X1);
    newX1=A/A(1);
    X21=S1*X1;
    X2=X21/X21(1);
    B=(D*X2);
    newX2=B/B(1);
    del2=newX2-X2;
    X2=newX2;
    X1=newX1;
    j=j+1;
end
w2=sqrt(1/B(1));
k=0;
X1=ones(3,1);
S2=((eye(3))-((newX1*(newX1)'*M)/((newX1)'*M*newX1))-((newX2*(newX2)'*M)/((newX2)'*M*newX2)));
while ((norm(del3,'fro'))>0.01)
    A=(D*X1);
    newX1=A/A(1);
    X21=S1*X1;
    X2=X21/X21(1);
    B=(D*X2);
    newX2=B/B(1);
    X31=S2*X2;
    X3=X31/X31(1);
    C=(D*X3);
    newX3=C/C(1);
    del3=newX3-X3;
    X3=newX3;
    X2=newX2;
    X1=newX1;
    k=k+1;
end
w3=sqrt(1/C(1));





