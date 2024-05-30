function[result] = check_overlap(a1,a2,b1,b2)
%判断区间是否有重合
result = 0;
if a1<=b2&&b2<=a2
    result = 1;
end
if a1<=b1&&b1<=a2
    result = 1;
end
if a1>=b1&&a2<=b2
    result =1;
end