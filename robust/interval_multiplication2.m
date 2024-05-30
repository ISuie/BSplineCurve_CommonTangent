function [r] = interval_multiplication2(f1,f2)
%区间与区间之间乘法
mi = min([f1(1)*f2(1),f1(1)*f2(2),f1(2)*f2(1),f1(2)*f2(2)]);
ma = max([f1(1)*f2(1),f1(1)*f2(2),f1(2)*f2(1),f1(2)*f2(2)]);

r = [mi,ma];