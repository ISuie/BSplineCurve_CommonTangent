function [result] = check_R(R)
%对R的模是否小于1的判断
result = 0;
r = zeros(2,2);
r(1,1) = max(abs(R{1,1}));
r(1,2) = max(abs(R{1,2}));
r(2,1) = max(abs(R{2,1}));
r(2,2) = max(abs(R{2,2}));
r1 = r(1,1)+r(1,2);
r2 = r(2,1)+r(2,2);
rm = max(r1,r2);
if rm < 1
    result = 1;
end

