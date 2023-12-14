function output=bound(X)
output=zeros(size(X));
for i=1:length(X)
    if X(i)>1
       X(i) = 1;
    end
    if X(i)<-1
        X(i) = -1;
    end
end
for i=1:length(X)  
        output(i) =X(i);   
end