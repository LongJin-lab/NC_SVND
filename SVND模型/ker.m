function K = ker(X,X2)
%parѡ������ݶ�����׼ȷ�ʼ������ش��Ӱ�졣
% K = X * X2'; -t 0 -- ���Ժ˺���: K(u,v)=u'*v
% K
% norm(X-X2)^3
r = 0.01;
f = norm(X-X2,2);
K = exp(-r*f^2);
% K = (X*X2')^2;
% if ~isempty(X2)
% 	  K = X * X2';
% else
% 	  K = X * X';
% end
end