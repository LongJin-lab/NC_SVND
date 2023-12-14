function dot_u=ZNNZF1rightside(t,u,k,data_y,afgo)
%求y(t)的导的函数,ode求解数据函数值的时候存在问题
%data_x(1,:)
global m;
n = 1, p = 2 * m;
%disp(data_x);
%学习率
gamma=100;
% xgm=1;%此处delta的维数需要注意，根据x的feature的变化而变化
delta=0.0001*ones(p,1);
%对应y(t)的三个值
x=u(1:m);
lambda=u(m+1:m+n,1);
mu=u(m+n+1:m+n+p,1);
% totel_el=u(n+m+p+1:2*(n+m+p),1);
%d(t) = b2(t) - A2(t)x(t),x有5个feature
e=vd(p)-mC(m)*x;
%返回对角值，如果a、b是矩阵，a./b就是a、b中对应的每个元素相除，得到一个新的矩阵
%Z(t)偏导,e是p*k维度
D1=diag(e./sqrt(e.*e+mu.*mu+delta)); 
D2=diag(mu./sqrt(e.*e+mu.*mu+delta));

% syms s1; 
%求导运算，有syms后s1可以直接求导
%求小v(t)的导的值
%Q=diff(vq(s1));
%s1=t; 
%dQ=eval(Q);n 
%小v(t)的导数
%dQ = zeros(n,1); 
%求b1(t)的导
%syms s2;
%B=diff(vb(s2));
%s2=t;
%dB=eval(B);
%b2的导数
%dB =zeros(m,8);

%dC=zeros(p,n);
%求大V(t)的导数
%syms s4;
%W=diff(mW(s4));
%s4=t;
%dW=eval(W);
%A(2)的导数
%dW = zeros(n,n);
%求A1(t)的导数
%syms s5;
%A=diff(mA(s5));
%s5=t;
%dA=eval(A);
%A1的导数
%dA = ones(m,n);

z1=zeros(n,n);
z2=zeros(n,p);
z3=zeros(p,n);
z4=zeros(p,p);
I=eye(p,p);
I2 = eye(m+n+p,m+n+p);
%G(t),为了防止奇异值出现，加上一个很小的单位阵
mM=[mW(m,data_y) mA(m,data_y)' mC(m)';mA(m,data_y) z1 z2;(D1-I)*mC(m) z3 I-D2]+0.000001*I2;
%H(t)
%mN=[dW dA' dC';dA z1 z2;dC z3 z4];  
%J(t)
mH=[mW(m,data_y) mA(m,data_y)' mC(m)';mA(m,data_y) z1 z2;-mC(m) z3 I];
%u(t)
%g=[dQ;-dB;z3];
%c(t)
v=[vq(m);-vb(n);vd(p)-sqrt(e.*e+mu.*mu+delta)]; 
%求逆,伪逆是pinv，逆是inv
m_M=inv(mM);
%求解dot_u
% rand_x = randn(1,1801)
if k==2
%      dot_u=m_M*(-mN*u(1:n+m+p)-g-gamma*signbipower(mH*u(1:n+m+p)+v));
%        dot_u=m_M*(-gamma*(mH*u(1:n+m+p)+v)*exp(t/2));
       %获取每一时刻的e(t)
%        dot_u(n+m+p+1:2*(n+m+p),1) = totel_el+(mH*u(1:n+m+p)+v);
%        dot_u(1:n+m+p,1)=m_M*(-gamma*(mH*u(1:n+m+p)+v)-xgm*dot_u(n+m+p+1:2*(n+m+p),1));
%        dot_u=m_M*(-gamma*abpower(mH*u(1:n+m+p)+v));
%        dot_u=m_M*(-gamma*(mH*u(1:n+m+p)+v)+(randn(1,1801)*0.01)');
       dot_u=m_M*(-gamma*(mH*u(1:m+n+p)+v)+afgo');
       t
%      totel_el
%采用pznn激活函数
end 
if k==3
      dot_u=m_M*(-mN*u(1:m+n+p)-g-gamma*PFunction(mH*u(1:m+n+p)+v,t));
end
if k==4
     dot_u=m_M*(-mN*u(1:m+n+p)-g-gamma*ssbp(mH*u(1:m+n+p)+v));
end
if k==9
      dot_u=m_M*(-mN*u(1:m+n+p)-g-gamma*combined(mH*u(1:m+n+p)+v));
end
if k==5
    dot_u=m_M*(-mN*u(1:m+n+p)-g-bound(mH*u(1:m+n+p)+v));
end    
if k==6
    dot_u=m_M*(-mN*u(1:m+n+p)-g-ball(mH*u(1:m+n+p)+v));
end 
if k==7
    dot_u=m_M*(-mN*u(1:m+n+p)-g-nonconvex(mH*u(1:m+n+p)+v));
end 
if k==8
    dot_u=m_M*(-mN*u(1:m+n+p)-g-sat(mH*u(1:m+n+p)+v,gamma));
end 
end
