function [v]= beziervalue(n1,n2,x,y,h)
%输入x，y坐标，求值
v=0;
for i2 = 0:n2
    for i1 = 0:n1
       [vx]= bernsteinvalue(n1,i1,x);
       [vy]= bernsteinvalue(n2,i2,y);
        v = v + h(i1+1+i2*(n1+1))*vx*vy;
    end
end