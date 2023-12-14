load('data.mat'); 
feature = 1 : 13;
label = 14;
r1 = 1;
r2 = 410;
r3 = r2 + 1;
r4 = 1025;
r5 = r4 - r2;
Train = data(r1:r2,:);
Test = data(r3 : r4, : );
[class, err]=classify(Test(:,feature), Train(:,feature),Train(:,label) , 'quadratic' );
TP = 0;
TN = 0;
FP = 0;
FN = 0;
for i = 1 : r5
    if class(i) == Test(i,14) && class(i) == 1
        TP = TP + 1;
    else if class(i) == Test(i,14) && class(i) == 0
            TN = TN + 1;
        else if class(i) ~= Test(i,14) && class(i) == 0
                FN = FN + 1;
            else
                FP = FP + 1;
            end
        end
   
    end
end
TP
TN
FP
FN
acc=(TP+TN)/(TP+TN+FP+FN)
pre=TP/(TP+FP)
rec = TP/(TP+FN)
MCC = ((TP* TN)-(FP* FN))/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)))
FN + FP + TP + TN + r2 