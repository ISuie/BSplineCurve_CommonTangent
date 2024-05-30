function [theta,vector] = anglerange(cpb,knot,p)
%对角度范围的求取
samplen = 3;
v0 = [0,0];
theta = [];
vector = [];

flag = 1;%如果向量小到大转，flag是1；大到小转，flag是0；
tt = linspace(knot(1),knot(2),samplen);
[ps1, dps, ddps1] = evalBern_rational_modify(cpb, p, knot(1),knot(2), tt);
vt0 = [dps(1,1),dps(1,2)];
vt1 = [dps(2,1),dps(2,2)];
vt2 = [dps(3,1),dps(3,2)];
[theta0] = angle(v0,vt0);
[theta1] = angle(v0,vt1);
[theta2] = angle(v0,vt2);
if theta0<theta2
if theta1<theta0||theta1>theta2
    flag = 0;
end
if flag == 1 
    theta = [theta0,theta2];
    vector = [vt0;vt2];
elseif flag == 0
    theta = [theta2,360;0,theta0;];
    vector = [vt2;vt0];
end
elseif theta0>theta2
    if theta1<theta2||theta1>theta0
        flag = 0;
    end
    if flag == 1
        theta = [theta2,theta0];
        vector = [vt2;vt0];
    elseif flag == 0
        theta = [theta0,360;0,theta2;];
        vector = [vt0;vt2];
    end
end