global data_x1;

load('TcmatrixT3.mat'); 
train_x = T3(:, 1:320); 
train_y = T3(:, 321:321); 

dataset_x = train_x;
[x11,ps1] = mapminmax(dataset_x, 0, 1);
dataset_x = x11; 

data_x1 = dataset_x;   
data_y = train_y;     
[o,h] = size(data_y); 

m = 2340, n = 1, p = 2 * m;
u0 = zeros (m+n+p,1);
tspan=linspace(0,1,150); 
options = odeset();
afgo = randn(1,m+n+p) * 0.01;
[t,u1(:,:)]=ode45(@ZNNZF1rightside,tspan,u0,options,2,data_y,afgo); % znn

Num1 = length(t);
for i = 1:Num1
    [mH1,v1]=solveHv(t(i),u1(i,1:n+m+p),data_y);
    NORM1(i)=norm(mH1*u1(i,1:n+m+p)'+v1);
end

figure (1);
plot(t,NORM1(:));
legend('ZNN');
xl=xlabel('t (s)');
yl=ylabel('¡¬E(t)¡¬2');

save('TcT3u1','u1');