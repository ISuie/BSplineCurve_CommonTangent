function [f]= tobij(h,n1,n2)
%h为原系数矩阵，n1为x最高次数，n2为y最高次数
%输出公式中bij
[ff]= toBernstein(n1,n2);
f = h*inv(ff);