function [r] = interval_multiplication(a,f)
%区间与常数乘法

if a >=0
    r = [a*f(1),a*f(2)];
else
    r = [a*f(2),a*f(1)];
end
