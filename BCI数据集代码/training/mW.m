function M=mW(m,data_y)
%M=[sin(t)/4+1 cos(t)/2;cos(t)/2 cos(t)/4+1];
% ��������ͷ�������˲���
global data_x1;
M = zeros(m,m);
%�Ȼ�ȡ�˺�����ֵ,��ȡk*k��ֵ��ÿ��k(xi,xj)��ά����k*k
%K = kernelmatrix(ker,data_x',data_x,par);
for i = 1:m
    for j = 1:m
        M(i,j) =ker(data_x1(i,:),data_x1(j,:));
        M(i,j) =data_y(i) * data_y(j) * M(i,j);
    end
end
end
         

