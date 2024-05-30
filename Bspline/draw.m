function [x,y,k] = draw(p,cpb,knot,pknot)

cpx1 = [];
cpx2 = [];
knot1 = [];
knot2 = [];
samplen = 3;
if abs(pknot-knot(1))>1e-3&&abs(pknot-knot(2))>1e-3
[cpx1,cpx2,knot1,knot2] = Divide(cpb,knot,pknot,p);
tt= linspace(knot1(1),knot1(2),samplen);
[ps, dps, ddps] = evalBern_rational_modify(cpx1, p, knot1(1), knot1(2), tt);
x = ps(length(ps(:,1)),1);
y = ps(length(ps(:,1)),2);
k = dps(3,2)/dps(3,1);
else
tt= linspace(knot(1),knot(2),samplen);
[ps, dps, ddps] = evalBern_rational_modify(cpb, p, knot(1), knot(2), tt);
if abs(pknot-knot(1))<1e-3
x = ps(1,1);
y = ps(1,2);
k = dps(1,2)/dps(1,1);
elseif abs(pknot-knot(2))<1e-3
x = ps(length(ps(:,1)),1);
y = ps(length(ps(:,1)),2);
k = dps(3,2)/dps(3,1);    
end
end