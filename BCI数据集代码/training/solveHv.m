function [mH,v]=solveHv(t,u,data_y)
m = 2340;
n = 1;
p = 2 * m;
delta=0.0001*ones(p,1);

mu=u(m+n+1:m+n+p)';
x=u(1:m);
e=vd(p)-mC(m)*x';
%dQ=zeros(n,1);
%dB=zeros(m,1);
z1=zeros(n,n);
z2=zeros(n,p);
z3=zeros(p,n);
I=eye(p,p);
%J(t)
mH=[mW(m,data_y) mA(m,data_y)' mC(m)';mA(m,data_y) z1 z2;-mC(m) z3 I];
%c(t)
v=[vq(m);-vb(n);vd(p)-sqrt(e.*e+mu.*mu+delta)];


