function output=PFunction(X,t,tc)
if  nargin==2
tc=0.1;
end
output=zeros(size(X));
 if t>tc
        output=X;

 else
        for i=1:length(X)
            output(i)=(exp(X(i))-1)/((tc-t)*exp(X(i)));
        end
 end