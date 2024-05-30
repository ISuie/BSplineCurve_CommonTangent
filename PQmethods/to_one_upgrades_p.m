function[Q] = to_one_upgrades_p(p)
%对Bernstein系数矩阵升阶
m = length(p)-1;
Q = zeros(1,m+2);
Q(1) = p(1);
Q(m+2) = p(m+1);
for i = 2 : m+1  
    Q(i) = ((i-1)/(m+1))*p(i-1)+(1-((i-1)/(m+1)))*p(i);
end