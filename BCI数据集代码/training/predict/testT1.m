m = 2340;
cal =0; 
b1 =0;
load('TcT5u1.mat');
load('TcmatrixT5.mat');
train_x = T5(:, 1:320); 
train_y = T5(:, 321:321); 

dataset_x = train_x;
[x11,ps1] = mapminmax(dataset_x, 0, 1);
dataset_x = x11; 

data_x1 = dataset_x;   
data_y1 = train_y;     
u_1 = u1(150,:)';

for s = 1:m
    if u_1(s)>0
       for i = 1:m
           b_1 = u_1(i)*data_y1(i)*ker(data_x1(s,:),data_x1(i,:));  
       end
       cal = cal+1;
       b1 = b1 + (1/data_y1(s) - b_1);
    end
end
%����b�ľ�ֵ,����ÿ����������b�ľ�ֵ�����Ե�ʱ���ǿ��ĸ�����������Ľ������Ǿ����ĸ��࣬Ȼ��ͳ����Щ�Ƿ��಻��ȷ�ġ�
% b0 = 1/cal * b0;  %���2��b���Դ�����
b1 = 1/cal * b1;


%�ò��Լ�Ԥ�⣬����׼ȷ���Ƕ��١�
o1 = 5580; % o1 is the number of test samples
load('testT.mat');
test_x = T(1:o1,1:320);
test_y = T(1:o1,321);

testdataset_x = test_x;
[x11,ps1] = mapminmax(testdataset_x, 0, 1);
testdataset_x = x11; 

test_x = testdataset_x;   
%[o1,h1] = size(test_y);
%for i = 1:o1
%    if test_y(i) == 3
%        test_y(i) =  1;
%    else
%        test_y(i) = -1;
%     end
% end

%ͨ��test_xԤ��test_y����sign��һ����
%ע��Ԥ�������x��y����ԭ��ѵ��ģ�͵����ݡ�
%ÿ��֧����������ѵ������һ�飬Ȼ��ѡȡ��ĳһѵ���������Ǹ���Ϊ��������ͳ��׼ȷ�ʡ�
% ax = 0;
% acc = 0;
% res = 0;
% err = 0;
% for i = 1:o1
%     for j = 1:n
%         ax = ax + u(j)*data_y1(j)*ker(test_x(i,:),data_x1(j,:));
%     end
%     pred = ax + b_2;
%     if pred > 0
%         res = res + 1;
%     else
%         err = err +1;
%     end
% end
% acc = res /(res+err);
% res
% err
% acc

ax1 = 0;
pred1 = 0;

Spell = [];
k = 0;
for i = 1:o1
    for j = 1:m
        ax1 = ax1 + u_1(j)*data_y1(j)*ker(test_x(i,:),data_x1(j,:));
        ax1;
    end
     pred1 = ax1 +b1;
     % R = [pred1,pred2,pred3,pred4];
     % R = [pred1,pred2,pred5];����ѡȡ�ĺ˺��������о���ѡȡ�Ƚϵ��Ǹ����������⣬�����Ȱ�ÿ�������ȱ��1����-1����ʽ��������ͨ���Ƚϴ�С����ȡ���յķ��������ο�svm�ıȽϷ���
     % [cc,kk] = max(R);
     % data_label(i) = kk;
     
     %ÿ�μ���Ҫ��ʱ���������㡣
     
     if (pred1 > 0)  
        Spell(i) = T(i,321);
        k = k + 1;
     end
     ax1=0;
end
Spell = Spell';
%��ӡdata_label���������������׼ȷ�ʡ�
% acc =0;
% for i = 1:o1
    %ע��д����Ӧ��Ԫ�ضԱȡ�
%    if data_label(i) ~= test_y(i)
%       acc = acc +1;
%    end
% end
% f1 = (o1 - acc)/o1;
% f1

% i = 12;
% j = 5;
% [predictchar] = spelling(i,j);
% predictchar