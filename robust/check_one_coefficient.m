function [result] = check_one_coefficient(f)
%对一个系数矩阵进行符号的判断
result = 0;
mi = min(f);
ma = max(f);

if (mi*ma-0)<=1e-10
    result =1;
end
