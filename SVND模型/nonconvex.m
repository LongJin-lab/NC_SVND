function output=nonconvex(E)

output=zeros(size(E));
L=length(E);
for i=1:L
    if E(i)>0.55
       E(i) = 1;
    end
    if E(i)<-0.55
        E(i) = -1;
    end
end

for i=1:L
    if E(i)>0.1
        if E(i)<0.55
           E(i) = 0.1;
        end
    end
    if E(i)<-0.1
           if E(i)>-0.55
               E(i) = -0.1;
           end
    end
end

for i=1:L
        output(i) =E(i);   
end