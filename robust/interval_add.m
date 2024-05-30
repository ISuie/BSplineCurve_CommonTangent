function [r] = interval_add(f1,f2,flag)
%区间之间加减法
if flag ==1
r = [f1(1)+f2(1),f1(2)+f2(2)];
elseif flag ==2
r = [f1(1)-f2(2),f1(2)-f2(1)];
end
