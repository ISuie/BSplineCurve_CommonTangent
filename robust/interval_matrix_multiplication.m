function [r] = interval_matrix_multiplication(a,c)
%区间矩阵与常数矩阵乘法 2x2形式

r = cell(2);
for i = 1:2
    for j = 1:2
        r1 = interval_multiplication(a(i,1),c{1,j});
        r2 = interval_multiplication(a(i,2),c{2,j});
        r3 = interval_add(r1,r2,1);
        r(i,j) = {r3};
    end
end