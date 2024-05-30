function [vector,vtpart] = findpartition(cpb1,cpb2,knot1,knot2,p1,p2)
%寻找两个单段曲线的公共段，将公共段的向量输出出来
%用角度的方法
%vector是选的公共区域的向量
%vtpart是将选中的哪个向量，选中是1，没选中是0，便于后续分割
theta1 = [];
theta2 =[];
vector = [];
vtpart = [];
vt1 = [];
vt2 = [];
[theta1,vt1] = anglerange2(cpb1,knot1,p1);
[theta2,vt2] = anglerange2(cpb2,knot2,p2);
[vector,vtpart] = thetatovector2(theta1,theta2,vt1,vt2);
            
