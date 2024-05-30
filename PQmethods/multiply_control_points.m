function [pq] = multiply_control_points(p,q)
%对不同变量的系数矩阵相乘
pq = zeros(length(q),length(p));
for i = 1 : length(q)
    for j = 1 : length(p)
       pq(i,j) = p(j)*q(i);
    end
end