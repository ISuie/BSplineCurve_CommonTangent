function [c] = metrix_to_cell(m)
%将矩阵变换成元胞数组
n = m(1,1,:);
k1 = m(:,1,1);
k2 = m(1,:,1);
c = cell(k1,k2);
for i = 1 : k1
    for j = 1 : k2
        c1 = [];
        for l = 1 : n
            c1 = [c1 m(i,j,n)];
        end
        c(i,j) = {c1};
    end
end