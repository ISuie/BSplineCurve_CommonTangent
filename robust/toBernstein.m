function [f]= toBernstein(n1,n2)
%输入x的最高次数n1,y的次数n2，输出x,y系数矩阵
f = [];
for j = 0:n2
    for i = 0:n1
         [ff]= toTwobernstein(n1,i,n2,j);
         f = [f;ff];
    end
end