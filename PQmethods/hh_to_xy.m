function [z] = hh_to_xy(hh)
n = length(hh(:,1));
m = length(hh(1,:));
z = '';
for i = 1 : n
    for j = 1 : m
        z = z + hh(i,j)*x^(m-1)*y^(n-1);
    end
end