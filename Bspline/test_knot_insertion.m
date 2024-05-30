clc;
clear;
close all
%    bsn - number of control points - 1
%    p - spline degree
%    ut - parametric point
%    U - knot sequence

%% rational B-spline 1
knot=[0, 0, 0, 0, 1/4, 2/4, 1,1,1,1];
p = 3;
bsn = length(knot)-p-2;



npatch = length(unique(knot))-1; 
% set control points for b-spline
% weights = 1 

weights = [2; 2; 3; 4; 5; 1];
weights = [1; 2; 1; 1; 1; 1];
cptx = [-5, 0, 1; 
    2, 6, 1; 
    3, -3, 1; 
    5, 0, 1; 
    8, -2, 1; 
    5, -5, 1];

cpx = cptx.*weights; % (x,y,1)*w, homogenize
ptdim = length(cpx(1,:));




uknot = unique(knot);
[cpbsA, intvals] = bezierExtractCpts(knot, p, cpx); % extract cpts and intervals; 
ncpbs = length(cpbsA(1,1,:)); % patch number

figure(1)
% sample number [-1,1]
samplen = 20;
xyvalue(:,:,1)  = zeros(samplen, ptdim-1); 
dvalue(:,:,1) = zeros(samplen, ptdim-1);
g=0
for j = 1:ncpbs
    cpb = cpbsA(:,:,j);
    %plot control polygon;
    plot(cpb(:,1)./cpb(:,3),cpb(:,2)./cpb(:,3),'--o') % dehomogenize 
    hold on;    
    tt = linspace(uknot(j),uknot(j+1),samplen);
    
    [ps, dps, ddps] = evalBern_rational_modify(cpb, p, uknot(j), uknot(j+1), tt);
    hold on;
    
    xyvalue(:,:,j) = ps;  
    dvalue(:,:,j) = dps;
    plot(ps(:,1),ps(:,2))
    %axis equal    
    hold on
end




[nknot, ncpx] = knotInsertion(knot,cpx,p, 0.6)
uknot = unique(nknot);
nknot
ncpx
[cpbsA, intvals] = bezierExtractCpts(nknot, p, ncpx); % extract cpts and intervals; 
ncpbs = length(cpbsA(1,1,:)); % patch number

for j = 1:ncpbs
    cpb = cpbsA(:,:,j);
    %plot control polygon;
    plot(cpb(:,1)./cpb(:,3),cpb(:,2)./cpb(:,3),'--o') % dehomogenize 
    hold on;    
    tt = linspace(uknot(j),uknot(j+1),samplen);
    [ps, dps, ddps] = evalBern_rational_modify(cpb, p, uknot(j), uknot(j+1), tt);
    hold on;
    
    xyvalue(:,:,j) = ps;  
    plot(ps(:,1),ps(:,2))
    %axis equal    
    hold on
end