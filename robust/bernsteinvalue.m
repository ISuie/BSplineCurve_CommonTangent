function [v]= bernsteinvalue(n,m,x)
v=0;
for i = m:n
    v= ((-1)^(m+i))*nchoosek(n,i)*nchoosek(i,m)*x^i+v;
end