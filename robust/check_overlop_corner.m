function [result] = check_overlop_corner(b1,b2)
%检测两区间是否是四个角相交，0为不相交，1为相交
result = 0;
if abs(b1(1)-b2(2))<=1e-5&&abs(b1(3)-b2(4))<=1e-5
    result = 1;
end
if abs(b1(2)-b2(1))<=1e-5&&abs(b1(3)-b2(4))<=1e-5
    result = 1;
end
if abs(b1(1)-b2(2))<=1e-5&&abs(b1(4)-b2(3))<=1e-5
    result = 1;
end
if abs(b1(2)-b2(1))<=1e-5&&abs(b1(4)-b2(3))<=1e-5
    result = 1;
end