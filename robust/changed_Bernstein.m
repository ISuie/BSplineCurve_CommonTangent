function [f]= changed_Bernstein(n1,n2,a,b,c,d)
%输入x的最高次数n1,y的次数n2，输出博森斯坦系数
f = [];
for j = 0:n2
    for i = 0:n1
         [ff]= changed_twobernstein(n1,i,a,b,n2,j,c,d);
         f = [f;ff];
    end
end