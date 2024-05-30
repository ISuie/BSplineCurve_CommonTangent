function [pq] = find_pq(n,point,a,b)
%求p（s）和q（t）
f= changed_Bernstein(n,0,a,b,0,1);
fx = [];
fy = [];
for i = 1 : n
    fx = [fx;f(i,:).*point(i,1)];
    fy = [fy;f(i,:).*point(i,2)];
end
fx = sum(fx,1);
fy = sum(fy,1);
pq = [fx;fy];