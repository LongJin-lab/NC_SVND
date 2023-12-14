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
%计算b的均值,计算每个分类器的b的均值，测试的时候，是看哪个分类器计算的结果最大，那就是哪个类，然后统计哪些是分类不正确的。
% b0 = 1/cal * b0;  %类别2的b，以此类推
b1 = 1/cal * b1;


%用测试集预测，看看准确率是多少。
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

%通过test_x预测test_y，用sign归一化。
%注意预测这里的x和y都是原来训练模型的数据。
%每个支持向量都用训练集跑一遍，然后选取在某一训练集最大的那个作为其类别，最后统计准确率。
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
     % R = [pred1,pred2,pred5];可能选取的核函数，还有就是选取比较的那个方法有问题，可以先把每个分类先变成1或者-1的形式，而不是通过比较大小来获取最终的分类结果。参考svm的比较方法
     % [cc,kk] = max(R);
     % data_label(i) = kk;
     
     %每次计算要及时把数据清零。
     
     if (pred1 > 0)  
        Spell(i) = T(i,321);
        k = k + 1;
     end
     ax1=0;
end
Spell = Spell';
%打印data_label并计算多分类任务的准确率。
% acc =0;
% for i = 1:o1
    %注意写出对应的元素对比。
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