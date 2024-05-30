function [f]= toOnebeizer(x,n)
%输入幂函数求bezier形式的bezier系数矩阵

f = zeros(1,n+1);
for ii = 1:n+1
    i = ii-1;
    for jj = ii : n+1
        j = jj-1;
        f(jj)=f(jj)+nchoosek(j,i)/nchoosek(n,i)*x(ii);
    end
end