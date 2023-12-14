global m;
global data_x1;
global data_y1;
global data_x2;
global data_y2; 


load('data_preprocess.mat');
r1 = 1;
r2 = 410;
r3 = r2 + 1;
r4 = 1025;
r5 = r4 - r2;
data_x1 = data(r1 : r2,1:13);
data_y1 = data(r1 : r2,14); 
data_x2 = data(r3 : r4,1:13);
data_y2 = data(r3 : r4,14); 
m = r2;
n = 1; p = 2 * m;
u0 = zeros (m+n+p,1);
tspan=linspace(0,1,150); 
options = odeset();
afgo = randn(1,m+n+p) * 0.01;
[t,u1(:,:)]=ode45(@ZNNZF1rightside,tspan,u0,options,2,data_y1,afgo); % znn

Num1 = length(t);
for i = 1:Num1
    [mH1,v1]=solveHv(t(i),u1(i,1:n+m+p),data_y1);
    NORM1(i)=norm(mH1*u1(i,1:n+m+p)'+v1);
end

u_1 = u1(150,:)';
cal =0; 
for s = 1:m
    cal =0; 
    b1 =0;
    if u_1(s)>0
       for i = 1:m
           b_1 = u_1(i) * data_y1(i) * ker(data_x1(s,:),data_x1(i,:));  
       end
       cal = cal+1;
       b1 = b1 + (1/data_y1(s) - b_1);
    end
end
b1 = 1/cal * b1;

[o1,c] = size(data_x2);
test_x = data_x2;
test_y = data_y2;
ax1 = 0;
pred1 = 0;
Spell = [];
k = 0;
for i = 1:o1
    for j = 1:m
        ax1 = ax1 + u_1(j) * data_y1(j) * ker(test_x(i,:),data_x1(j,:));
        ax1;
    end
     pred1 = ax1 + b1;
     if (pred1 > 0)  
        Spell(i) = 1;
        k = k + 1;
     else
         Spell(i) = -1;
     end
     ax1=0;
end
class = Spell';
TP = 0;
TN = 0;
FP = 0;
FN = 0;
r5 =r4 - r2;
for i = 1 : r5
    if class(i) == data_y2(i) && class(i) == 1
        TP = TP + 1;
    else if class(i) == data_y2(i) && class(i) == -1
            TN = TN + 1;
        else if class(i) ~= data_y2(i) && class(i) == -1
                FN = FN + 1;
            else
                FP = FP + 1;
            end
        end
   
    end
end
TP
TN
FP
FN
acc=(TP+TN)/(TP+TN+FP+FN)
pre=TP/(TP+FP)
rec = TP/(TP+FN)
MCC = ((TP* TN)-(FP* FN))/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)))
FN + FP + TP + TN + r2
plot(tspan,NORM1);