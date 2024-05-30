function [cpx1,cpx2,knot1,knot2] = Divide(cpx,knot,dknot,p)
%用来做一段线的单个点的分割
%dknot加入的分割点
%knot分割前的点
%cpx分割前的控制点
%cpx1，cpx2分别是分割后的控制点
%knot1，knot2分别是分割后的点
knot1 = [knot(1),dknot];
knot2 = [dknot,knot(2)];
qknot = knot;
for i = 1 : p
    qknot = [knot(1),qknot,knot(2)];
end
[aknot, acpx] = knotInsertion(qknot,cpx,p,dknot);
 [cpbsA, intvals] = bezierExtractCpts(aknot, p, acpx); 
 cpx1 = cpbsA(:,:,1);
 cpx2 = cpbsA(:,:,2);