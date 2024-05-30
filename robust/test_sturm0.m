clc;
clear;
close all
syms u;

y = ((u-2)^2)*(u-1);
y= expand(y);
[N,n] = find_sturmN(y);


n1 = [];
for i = 1 : length(n)
    f = n{1,i};
    k = polyval(f,0);
    n1 = [n1,k];
end
n2 = [];
for i = 1 : length(n)
    f = n{1,i};
    k = polyval(f,7/3);
    n2 = [n2,k];
end

[N1] = count_sturm(n1);
[N2] = count_sturm(n2);
N = N1-N2;
