function[r] = binomialvalue(n,m,h,x,y)
r = 0;
for j = 0:m
    for i = 0:n
        r = r+ h(j+1,i+1)*x^i*y^j;
    end
end