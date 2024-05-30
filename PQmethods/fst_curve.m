function[v] = fst_curve(fhh)
v = 0;
syms x
syms y
for i = 1 : length(fhh(1,:))
    for j = 1 : length(fhh(:,1))
        v = v + fhh(j,i)*x^(i-1)*y^(j-1);
    end
end