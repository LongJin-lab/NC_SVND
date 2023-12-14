function K = ker(X,X2)
%  K = X * X2';
%par选择的数据对最后的准确率计算有重大的影响。
% % r = 0.01;
K = X * X2';
% K
% norm(X-X2)^3
% K = exp(-r*|X-X2|^2);
% K = (X*X2')^2;
% if ~isempty(X2)
% 	  K = X * X2';
% else
% 	  K = X * X';
% end
end