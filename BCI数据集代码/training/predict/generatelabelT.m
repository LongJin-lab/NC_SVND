clear all;
load('10TestT.mat');

%% F
for i = 1 : 180
    if (T(i,321) == 6 || T(i,321) == 7)
        T(i,322) = 1;
    else
        T(i,322) = -1;
    end
end

%% O
for i = 181 : 540
    if (T(i,321) == 3 || T(i,321) == 9)
        T(i,322) = 1;
    else
        T(i,322) = -1;
    end
end

%% D
for i = 541 : 720
    if (T(i,321) == 4 || T(i,321) == 7)
        T(i,322) = 1;
    else
        T(i,322) = -1;
    end
end

%% M
for i = 721 : 900
    if (T(i,321) == 1 || T(i,321) == 9)
        T(i,322) = 1;
    else
        T(i,322) = -1;
    end
end

%% 0
for i = 901 : 1260
    if (T(i,321) == 3 || T(i,321) == 9)
        T(i,322) = 1;
    else
        T(i,322) = -1;
    end
end

%% T
for i = 1261 : 1440
    if (T(i,321) == 2 || T(i,321) == 10)
        T(i,322) = 1;
    else
        T(i,322) = -1;
    end
end

%% H
for i = 1441 : 1620
    if (T(i,321) == 2 || T(i,321) == 8)
        T(i,322) = 1;
    else
        T(i,322) = -1;
    end
end

%% A
for i = 1621 : 1800
    if (T(i,321) == 1 || T(i,321) == 7)
        T(i,322) = 1;
    else
        T(i,322) = -1;
    end
end

%% M
for i = 1801 : 1980
    if (T(i,321) == 1 || T(i,321) == 9)
        T(i,322) = 1;
    else
        T(i,322) = -1;
    end
end

%% P
for i = 1981 : 2160
    if (T(i,321) == 4 || T(i,321) == 9)
        T(i,322) = 1;
    else
        T(i,322) = -1;
    end
end

%% I
for i = 2161 : 2340
    if (T(i,321) == 3 || T(i,321) == 8)
        T(i,322) = 1;
    else
        T(i,322) = -1;
    end
end

%% E
for i = 2341 : 2520
    if (T(i,321) == 5 || T(i,321) == 7)
        T(i,322) = 1;
    else
        T(i,322) = -1;
    end
end

%% C
for i = 2521 : 2700
    if (T(i,321) == 3 || T(i,321) == 7)
        T(i,322) = 1;
    else
        T(i,322) = -1;
    end
end

%% A
for i = 2701 : 2880
    if (T(i,321) == 1 || T(i,321) == 7)
        T(i,322) = 1;
    else
        T(i,322) = -1;
    end
end

%% K
for i = 2881 : 3060
    if (T(i,321) == 5 || T(i,321) == 8)
        T(i,322) = 1;
    else
        T(i,322) = -1;
    end
end

%% E
for i = 3061 : 3240
    if (T(i,321) == 5 || T(i,321) == 7)
        T(i,322) = 1;
    else
        T(i,322) = -1;
    end
end

%% T
for i = 3241 : 3420
    if (T(i,321) == 2 || T(i,321) == 10)
        T(i,322) = 1;
    else
        T(i,322) = -1;
    end
end

%% U
for i = 3421 : 3600
    if (T(i,321) == 3 || T(i,321) == 10)
        T(i,322) = 1;
    else
        T(i,322) = -1;
    end
end

%% N
for i = 3601 : 3780
    if (T(i,321) == 2 || T(i,321) == 9)
        T(i,322) = 1;
    else
        T(i,322) = -1;
    end
end

%% A
for i = 3781 : 3960
    if (T(i,321) == 1 || T(i,321) == 7)
        T(i,322) = 1;
    else
        T(i,322) = -1;
    end
end

%% Z
for i = 3961 : 4140
    if (T(i,321) == 2 || T(i,321) == 11)
        T(i,322) = 1;
    else
        T(i,321+1) = -1;
    end
end

%% Y
for i = 4141 : 4320
    if (T(i,321) == 1 || T(i,321) == 11)
        T(i,321+1) = 1;
    else
        T(i,321+1) = -1;
    end
end

%% G
for i = 4321 : 4500
    if (T(i,321) == 1 || T(i,321) == 8)
        T(i,321+1) = 1;
    else
        T(i,321+1) = -1;
    end
end

%% O
for i = 4501 : 4680
    if (T(i,321) == 3 || T(i,321) == 9)
        T(i,321+1) = 1;
    else
        T(i,321+1) = -1;
    end
end

%% T
for i = 4681 : 4860
    if (T(i,321) == 2 || T(i,321) == 10)
        T(i,321+1) = 1;
    else
        T(i,321+1) = -1;
    end
end

%% 4
for i = 4861 : 5040
    if (T(i,321) == 6 || T(i,321) == 11)
        T(i,321+1) = 1;
    else
        T(i,321+1) = -1;
    end
end

%% 5
for i = 5041 : 5220
    if (T(i,321) == 1 || T(i,321) == 12)
        T(i,321+1) = 1;
    else
        T(i,321+1) = -1;
    end
end

%% 6
for i = 5221 : 5400
    if (T(i,321) == 2 || T(i,321) == 12)
        T(i,321+1) = 1;
    else
        T(i,321+1) = -1;
    end
end

%% 7
for i = 5401 : 5580
    if (T(i,321) == 3 || T(i,321) == 12)
        T(i,321+1) = 1;
    else
        T(i,321+1) = -1;
    end
end

%% ±£´ælabel
save('10TestTwithLabel','T');