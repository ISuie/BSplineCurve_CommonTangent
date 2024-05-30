function [m,n] = cell_to_matrix(c)
%将元胞数组转换为矩阵
k = size(c);
n = length(c{1,1});
m = zeros(k(1),k(2),n);
for i = 1 : k(1)
    for j = 1 : k(2)
        for l = 1 : n
            m(i,j,n) = c{i,j}(n);
        end
    end
end