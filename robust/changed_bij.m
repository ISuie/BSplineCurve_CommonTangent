function [f]= changed_bij(h,n1,n2,a,b,c,d)
%h为原系数矩阵，n1为x最高次数，n2为y最高次数
%输出公式中bij
[ff]= changed_Bernstein(n1,n2,a,b,c,d);
f = h*pinv(ff);
%disp('ff条件数');
%disp(cond(ff));