function K = ker(X,X2)
%  K = X * X2';
%parѡ������ݶ�����׼ȷ�ʼ������ش��Ӱ�졣
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