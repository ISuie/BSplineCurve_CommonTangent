function[b] = upgrades_bernstein_to_bij(bs1,x)
%将bs1数组表示的Bernstein函数转换为bij
%x，y为[xl,xr]
k = length(bs1(:,1));
b = zeros(1,bs1(1,2)+1);
for i = 1 : k
    b1 = changed_onebernstein(bs1(i,2),bs1(i,3),x(1),x(2));
    b2 = bs1(i,1).*b1;
    b = b+b2;
end