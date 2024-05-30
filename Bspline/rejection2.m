function [result] = rejection2(p1,p2,cpb1,cpb2,knot1,knot2)
%对两个单独段曲线的retect判断
%result=1没被拒绝
%result=0被拒绝
samplen = 3;
tt1 = linspace(knot1(1),knot1(length(knot1)),samplen);
[ps1, dps1, ddps1] = evalBern_rational_modify(cpb1, p1, knot1(1), knot1(length(knot1)), tt1);
tt2 = linspace(knot2(1),knot2(length(knot2)),samplen);
[ps2, dps2, ddps2] = evalBern_rational_modify(cpb2, p2, knot2(1), knot2(length(knot2)), tt2);
dpointx1 = [dps1(1,1),dps1(length(dps1(:,1)),1)];
dpointy1 = [dps1(1,2),dps1(length(dps1(:,1)),2)];
dpointx2 = [dps2(1,1),dps2(length(dps2(:,1)),1)];
dpointy2 = [dps2(1,2),dps2(length(dps2(:,1)),2)];
[curvedr]= direction(dpointx1,dpointy1,dpointx2,dpointy2);
kx1 = dps1(:,2)./dps1(:,1);

result = 1;
flag = 1;
for k2 = 1:length(cpb2(:,1,1))
                   x=cpb2(k2,1,1)/cpb2(k2,3,1);
                   y=cpb2(k2,2,1)/cpb2(k2,3,1);
                   [rs,uporlower]= Area(kx1(1),ps1(1,1),ps1(1,2),kx1(2),ps1(2,1),ps1(2,2),kx1(3),ps1(3,1),ps1(3,2),x,y);
                   if curvedr==1&&uporlower==0&&rs==1 %rejection准则2
                       result=0;
                      break
                   end
                   if rs==0%rejection准则1
                       flag=0;
                       break
                   end
end
if flag==1
result=0;
end
