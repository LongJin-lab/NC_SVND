function output=ball(X)
if norm(X)>0.8
   X = -0.8*(X./norm(X));
end
output=X;
end