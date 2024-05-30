function[f] = coefficient_interval(coe)
%求出bezier的系数区间
min = 0;
max = 0;
for i = 1:length(coe)
    if coe(i)<min
        min = coe(i);
    end
    if coe(i)>max
        max = coe(i);
    end
end
f = [min max];