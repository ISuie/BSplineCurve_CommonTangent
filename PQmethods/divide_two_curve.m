function [q1,q2] = divide_two_curve(p,lam,flag)
%对二元曲线的分割，p是控制点矩阵，flag==1,竖着割，flag==2，横着割，lam是左边块或者上边块的占比

k1 = length(p(:,1));
k2 = length(p(1,:));
if flag==1
q1 =[];
q2= [];
for i = 1 : k1
    [q11,q22] = divide_one_curve(p(i,:),lam);
    q1 = [q1;q11];
    q2 = [q2;q22];
end
elseif flag==2
q1 = [];
q2 = [];
for i = 1 : k2
    [q11,q22] = divide_one_curve(p(:,i)',lam);
    q1 = [q1 q11'];
    q2 = [q2 q22'];
end
end
