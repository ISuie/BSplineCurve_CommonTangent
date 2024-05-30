function [pp] = multiply_s_control_points(p1,p2)
%对相同变量的系数矩阵相乘
m = length(p1);
n = length(p2);
pp = zeros(1,m+n-1);
for i = 1 : m
    for j = 1 : n
        bs1 = [p1(i),m-1,i-1];
        bs2 = [p2(j),n-1,j-1];
        [bs] = multiply_ss_bernstein(bs1,bs2);
        pp(bs(3)+1) = bs(1)+pp(bs(3)+1);
    end
end