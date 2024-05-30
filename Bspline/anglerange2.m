function [theta,vector] = anglerange2(cpb,knot,p)
%对角度范围的求取（超过180减去180）
%角度范围在pi内
samplen = 3;
v0 = [0,0];
theta = [];
vector = [];
tt = linspace(knot(1),knot(2),samplen);
[ps1, dps, ddps1] = evalBern_rational_modify(cpb, p, knot(1),knot(2), tt);
vt0 = [dps(1,1),dps(1,2)];
vt1 = [dps(2,1),dps(2,2)];
vt2 = [dps(3,1),dps(3,2)];
[theta0] = angle(v0,vt0);
[theta1] = angle(v0,vt1);
[theta2] = angle(v0,vt2);
[theta,vector] = Thetarange(theta0,theta1,theta2,vt0,vt2);