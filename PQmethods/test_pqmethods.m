clc;
clear;
close all
%% 

knot1=[0,0,0,0,1,1,1,1];
p1 = 3;
bsn1 = length(knot1)-p1-2;
npatch1 = length(unique(knot1))-1; 
% set control points for b-spline
% weights = 1 
weights1 = [1; 1; 1; 1;];
cptx1 = [0,0, 1; 
   2, 3, 1; 
    4, 2, 1; 
   5, 0, 1;
   ];
cpx1 = cptx1.*weights1; % (x,y,1)*w, homogenize
ptdim1 = length(cpx1(1,:));
uknot1 = unique(knot1);
[cpbsA1, intvals1] = bezierExtractCpts(knot1, p1, cpx1); % extract cpts and intervals; 
ncpbs1 = length(cpbsA1(1,1,:)); % patch number
figure(1)
% sample number [-1,1]
samplen = 20;
xyvalue1(:,:,1)  = zeros(samplen, ptdim1-1); 
dvalue1(:,:,1) = zeros(samplen, ptdim1-1);
for j = 1:ncpbs1
    cpb1 = cpbsA1(:,:,j);
    tt1 = linspace(uknot1(j),uknot1(j+1),samplen);
    [ps1, dps1, ddps1] = evalBern_rational_modify(cpb1, p1, uknot1(j), uknot1(j+1), tt1);
    xyvalue1(:,:,j) = ps1;  
    dvalue1(:,:,j) = dps1;
    %axis equal    
    hold on
    plot(ps1(:,1),ps1(:,2));
end

knot2=[0, 0, 0, 0,1,1,1,1];
p2 =3;
bsn2 = length(knot2)-p2-2;
npatch2 = length(unique(knot2))-1; 
% set control points for b-spline
% weights = 1 
weights2 = [1; 1; 1; 1;];
cptx2 = [6,0,1; 
  7,3, 1; 
  9, 4,1; 
 10,0,1;
]; 
cpx2 = cptx2.*weights2; % (x,y,1)*w, homogenize
ptdim2 = length(cpx2(1,:));
uknot2 = unique(knot2);
[cpbsA2, intvals2] = bezierExtractCpts(knot2, p2, cpx2); % extract cpts and intervals; 
ncpbs2 = length(cpbsA2(1,1,:)); % patch number
figure(1)
% sample number [-1,1]
samplen = 20;
xyvalue2(:,:,1)  = zeros(samplen, ptdim2-1); 
dvalue2(:,:,1) = zeros(samplen, ptdim2-1);
for j = 1:ncpbs2
    cpb2 = cpbsA2(:,:,j);
    %plot control polygon;
    tt2 = linspace(uknot2(j),uknot2(j+1),samplen);
    %plot(cpb2(:,1)./cpb2(:,3),cpb2(:,2)./cpb2(:,3),'--o') % dehomogenize 
    hold on;    
    %[ps, dps, ddps] = evalBernRational(cpb, p, s0);
    %[ps, dps, ddps] = evalBern_rational_s0s1(cpb, p, uknot(j), uknot(j+1), tt);
    [ps2, dps2, ddps2] = evalBern_rational_modify(cpb2, p2, uknot2(j), uknot2(j+1), tt2);
    hold on;
[cpbsA2, intvals2] = bezierExtractCpts(knot2, p2, cpx2);
 
    xyvalue2(:,:,j) = ps2;  
    dvalue2(:,:,j) = dps2;
    plot(ps2(:,1),ps2(:,2));
    %axis equal    
    hold on
end
%% PQmethods
block1 = [0,1];
p1= 3;
cpb1 =  cptx1;

block2 = [0,1];
p2= 3;
cpb2 = cptx2;

point1 = find_point(cpb1);
point2 = find_point(cpb2);



[fst,gst] = find_fst_qst(point1,point2,p1,p2,block1(1),block1(2),block2(1),block2(2));
%% Krawczyk
x = 1;
y = 1;
[f_h,n1,m1] = turn_to_h(fst);
[g_h,n2,m2] = turn_to_h(gst);

[f_hh] = h_to_hh(n1,f_h);
[g_hh] = h_to_hh(n2,g_h);


[fst_h] = hh_to_h(fst);
[gst_h] = hh_to_h(gst);
[v1] = fst_curve(f_hh);
[v2] = fst_curve(g_hh);
v11 = sum(f_h);
v22 = sum(g_h);

B = [block1,block2];



e =1e-3;
T0=5;
N0=100;
[I] =  Intersections_with_interval(n1,m1,n2,m2,f_h,g_h,B,T0,e,N0);
figure(2)
subplot(2,3,1);
hold on;
c1=fimplicit(v1,B);
set(c1,'color','b');
fimplicit(v2,B);
scatter(I(1,1),I(1,2));
figure(1)
hold on;
[x1,y1,k1] = draw(p1,cpb1,block1,I(1,1));
[x2,y2,k2] = draw(p2,cpb2,block2,I(1,2));
plot([x1,x2],[y1,y2]);
[x1,y1,k1] = draw(p1,cpb1,block1,I(2,1));
[x2,y2,k2] = draw(p2,cpb2,block2,I(2,2));
plot([x1,x2],[y1,y2]);