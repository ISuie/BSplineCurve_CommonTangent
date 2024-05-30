function [f]= toOnebernstein(n,m)
%输入为Bn m（x）形式(n在上)，输出x系数矩阵
f = zeros(1,n+1);

for i = m:n
    f(i+1)= (-1)^(m+i)*nchoosek(n,i)*nchoosek(i,m);
end