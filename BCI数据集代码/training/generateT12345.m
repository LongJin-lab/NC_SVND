% ����������u1��������ݼ���ע�ⲻҪ���������T1��T2��T3��֮ǰ��T1��T2��T3
load('mixupmatrixTc.mat');
T1 = [];
T2 = [];
T3 = [];
T4 = [];
T5 = [];
T1(1:2340,:) = Tc(1:2340,:);
T2(1:2340,:) = Tc(2341:4680,:);
T3(1:2340,:) = Tc(4681:7020,:);
T4(1:2340,:) = Tc(7021:9360,:);
T5(1:2340,:) = Tc(9361:11700,:);
save('TcmatrixT1','T1');
save('TcmatrixT2','T2');
save('TcmatrixT3','T3');
save('TcmatrixT4','T4');
save('TcmatrixT5','T5');