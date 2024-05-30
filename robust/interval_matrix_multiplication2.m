function [r] = interval_matrix_multiplication2(f1,f2)
%区间矩阵与区间矩阵之间乘法 2x1形式

r = cell(length(f1(:,1)),length(f2(1,:)));
for i = 1:2
        r1 = interval_multiplication2(f1{i,1},f2{1,1});
        r2 = interval_multiplication2(f1{i,2},f2{2,1});
        r3 = interval_add(r1,r2,1);
        r(i,1) = {r3};
end