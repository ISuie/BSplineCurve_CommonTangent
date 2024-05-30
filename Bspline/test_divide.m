clc;
clear;
close all

knot1=[0, 0, 0, 0, 1,1,1,1];
p1 = 3;
bsn1 = length(knot1)-p1-2;

npatch1 = length(unique(knot1))-1; 
% set control points for b-spline
% weights = 1 
weights1 = [1; 1; 1; 1; ];
cptx1 = [0, 0, 1; 
    2, 3, 1; 
    4, 2, 1; 
    5, 0, 1; 
   ];
cpx1 = cptx1.*weights1; % (x,y,1)*w, homogenize
ptdim1 = length(cpx1(1,:));

uknot1 = unique(knot1);
[cpbsA1, intvals1] = bezierExtractCpts(knot1, p1, cpx1); % extract cpts and intervals; 

knot = 0.5;
[dcpx1,dcpx2,dknot1,dknot2] = Divide(cpx1,uknot1,knot,p1);
knot = 0.3
[dcpx1,dcpx2,dknot1,dknot2] = Divide(dcpx1,dknot1,knot,p1);