function[f] = Binomial_theorem(n,a,b)
%二项式展开，n是次数，a是常数，b是x前系数，（a+bx）n次方形式

f = zeros(1,n+1);
for i = 1:n+1
    f(i)=nchoosek(n,i-1)*a^(n-i+1)*b^(i-1);
end

