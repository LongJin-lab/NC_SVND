function M=mW(m,data_y)
%M=[sin(t)/4+1 cos(t)/2;cos(t)/2 cos(t)/4+1];
% 随机产生惩罚参数与核参数
global data_x1;
M = zeros(m,m);
%先获取核函数的值,获取k*k的值。每个k(xi,xj)的维度是k*k
%K = kernelmatrix(ker,data_x',data_x,par);
for i = 1:m
    for j = 1:m
        M(i,j) =ker(data_x1(i,:),data_x1(j,:));
        M(i,j) =data_y(i) * data_y(j) * M(i,j);
    end
end
end
         

