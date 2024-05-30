clc;
clear;
close all

addpath(genpath('D:\Research\CoTangentLine\Code'));
%    bsn - number of control points - 1
%    p - spline degree
%    ut - parametric point
%    U - knot sequence

%% rational B-spline 1
knot1 =[0, 0, 0, 0, 1/3, 2/3, 1, 1, 1, 1];
knot1 = [0,0,0,0,1,1,1,28.2843,28.2843,28.2843,95.3663,95.3663,95.3663,153.676,153.676,153.676,203.676,203.676,203.676,246.102,246.102,246.102,246.102,246.102];
knot21 =[0 0 0 0 0 0 50.9902 50.9902 50.9902 118.072 118.072 118.072 162.794 162.794 162.794 162.794 162.794 162.794];
knot21 = [0, 0, 0, 0, 1,1,1,1];
knot31 = [0 0 0 0 0 0 28.2843 28.2843 28.2843 95.3663 95.3663 95.3663 153.676 153.676 153.676 203.676 203.676 203.676 246.102 246.102 246.102 246.102 246.102 246.102];
knot1 = knot31; 
knot1 = knot21; 


p1 = 5;
p1=3;
bsn1 = length(knot1)-p1-1;

npatch = length(unique(knot1))-1; 
% set control points for b-spline
% weights = 1 

weights = [2; 2; 3; 4; 5; 1];
weights = [1; 1; 2; 1; 4; 1];
weights = ones(bsn1,1);
weights =  [1; 1; 1; 1; ];

cptx21 =[-50, -80, 0, 1;
-57.8176, -69.4587, 0, 1;
-62.6375, -59.1928, 0, 1;
-64.4596, -49.2025, 0, 1;
-61.7374, -26.7069, 0, 1;
-47.7101, -5.42976, 0,  1;
-38.1165, 6.37526, 0,  1;
-27.2355, 26.0019, 0,  1;
-30.0786, 45.8306, 0,  1;
-33.9675, 53.8246, 0,  1;
-40.6079, 61.8811, 0,  1;
-50, 70, 0,  1];

cptx21 =[-50, -80, 0, 1;
-57.8176, -69.4587, 0, 1;
-62.6375, -59.1928, 0, 1;
-64.4596, -49.2025, 0, 1;
1.7374, -26.7069, 0, 1;
-47.7101, -5.42976, 0,  1;
-38.1165, 6.37526, 0,  1;
-27.2355, 26.0019, 0,  1;
-30.0786, 45.8306, 0,  1;
-33.9675, 53.8246, 0,  1;
-40.6079, 61.8811, 0,  1;
-50, 70, 0,  1];


cptx21 =[-50, -80, 0, 1;
-57.8176, -69.4587, 0, 1;
-62.6375, -59.1928, 0, 1;
-64.4596, -49.2025, 0, 1;
1.7374, -26.7069, 0, 1;
-47.7101, -5.42976, 0,  1;
-38.1165, 6.37526, 0,  1;
-27.2355, 26.0019, 0,  1;
-30.0786, 45.8306, 0,  1;
-33.9675, 53.8246, 0,  1;
-40.6079, 61.8811, 0,  1;
-50, 70, 0,  1];

cptx21 = [0, 0,0, 1; 
    2, 3,0, 1; 
    4, 2,0, 1; 
    5, 0,0, 1; 
  ];



cptx = cptx21; 


    
ptdim = length(cptx(1,:));
cptn = length(cptx(:,1));

cpx = cptx.*weights; % (x,y,1)*weight, homogenize
ptdim = length(cpx(1,:));



[cpbsA, intvals] = bezierExtractCpts(knot1, p1, cpx); % extract cpts and intervals; 
ncpbs1 = length(cpbsA(1,1,:)); % patch number

figure(1)
% sample number [-1,1]
samplen = 500;

xyvalue1(:,:,1)  = zeros(samplen, ptdim-1); 
dvalue1(:,:,1) = zeros(samplen, ptdim-1);
npatch1 = length(unique(knot1))-1; 
uknot0 = unique(knot1);
for j = 1:ncpbs1
    cpb = cpbsA(:,:,j);
    %plot control polygon;
%     plot(cpb(:,1)./cpb(:,3),cpb(:,2)./cpb(:,3),'--o') % dehomogenize 
%     hold on;         
    %[ps, dps, ddps] = evalBernRational(cpb, p, s0);
    ss = linspace(uknot0(j),uknot0(j+1),samplen);
    [ps, dps, ddps] = evalBern_rational_modify(cpb, p1, uknot0(j), uknot0(j+1), ss);
    
    %dps
   
    xyvalue1(:,:,j) = ps;  
    dvalue1(:,:,j) = dps;
    if (ptdim-1 == 2)
        plot(ps(:,1),ps(:,2))
    else
        plot3(ps(:,1),ps(:,2),ps(:,3))
    end
    %axis equal    
    hold on
end



%% rational B-spline 2
knot2 = [0 0 0 0 0 0 98.9949 98.9949 98.9949 184.435 184.435 184.435 245.263 245.263 245.263 299.114 299.114 299.114 393.454 393.454 393.454 393.454 393.454 393.454];

knot22 = [0 0 0 0 0 0 58.3095 58.3095 58.3095 128.31 128.31 128.31 178.31 178.31 178.31 178.31 178.31 178.31];
knot32 = [0 0 0 0 0 0 98.9949 98.9949 98.9949 184.435 184.435 184.435 245.263 245.263 245.263 299.114 299.114 299.114 393.454 393.454 393.454 393.454 393.454 393.454 ];
knot22 = [0, 0, 0, 0, 1,1,1,1];
knot2 =knot22; 
knot2 = knot22; 

p2 = 5;
p2=3;
bsn = length(knot2)-p2-1;

npatch2 = length(unique(knot2))-1; 
% set control points for b-spline
% weights = 1 
weights = ones(bsn,1);
weights = [1; 1; 1; 1];





cptx22 = [50, 60, 0, 1
41.5555, 51.5468, 0,  1
34.324, 42.294, 0,  1
28.3053, 32.2417, 0,  1
17.7303, 58.36223, 0,  1
13.48, 18.122, 0,  1
13.2051, 32.8932, 0,  1
16.8462, 57.0606, 0,  1
27.9722, 78.0291, 0,  1
33.9614, 86.0594, 0,  1
41.304, 93.383, 0, 1
50, -100, 0, 1];

cptx22 = [50, 60, 0, 1
41.5555, 51.5468, 0,  1
34.324, 42.294, 0,  1
28.3053, 32.2417, 0,  1
17.7303, 58.36223, 0,  1
13.48, 18.122, 0,  1
13.2051, 32.8932, 0,  1
16.8462, 57.0606, 0,  1
27.9722, 78.0291, 0,  1
33.9614, 86.0594, 0,  1
41.304, -93.383, 0, 1
50, -100, 0, 1];


cptx22 = [50, 60, 0, 1
41.5555, 51.5468, 0,  1
34.324, 42.294, 0,  1
28.3053, 32.2417, 0,  1
17.7303, 58.36223, 0,  1
13.48, 18.122, 0,  1
13.2051, 32.8932, 0,  1
16.8462, 57.0606, 0,  1
27.9722, 78.0291, 0,  1
33.9614, -86.0594, 0,  1
41.304, -93.383, 0, 1
50, -100, 0, 1];


cptx22 = [50, 60, 0, 1
41.5555, 51.5468, 0,  1
34.324, 42.294, 0,  1
28.3053, 32.2417, 0,  1
17.7303, 58.36223, 0,  1
13.48, 18.122, 0,  1
13.2051, 32.8932, 0,  1
16.8462, 57.0606, 0,  1
27.9722, 78.0291, 0,  1
33.9614, -86.0594, 0,  1
41.304, -93.383, 0, 1
50, 100, 0, 1];

cptx22 = [50, 60, 0, 1
41.5555, 51.5468, 0,  1
34.324, 42.294, 0,  1
28.3053, 32.2417, 0,  1
17.7303, 58.36223, 0,  1
13.48, 18.122, 0,  1
63.2051, 32.8932, 0,  1
16.8462, 57.0606, 0,  1
27.9722, 78.0291, 0,  1
33.9614, -86.0594, 0,  1
41.304, -93.383, 0, 1
40, 100, 0, 1];


cptx22 = [50, 60, 0, 1
41.5555, 51.5468, 0,  1
34.324, 42.294, 0,  1
28.3053, 32.2417, 0,  1
17.7303, 58.36223, 0,  1
13.48, 18.122, 0,  1
13.2051, 32.8932, 0,  1
16.8462, 57.0606, 0,  1
27.9722, 78.0291, 0,  1
33.9614, 86.0594, 0,  1
41.304, 93.383, 0, 1
50, -100, 0, 1];

cptx22 = [50, 60, 0, 1
41.5555, 51.5468, 0,  1
34.324, 42.294, 0,  1
28.3053, 32.2417, 0,  1
17.7303, 8.36223, 0,  1
13.48, 18.122, 0,  1
13.2051, 32.8932, 0,  1
16.8462, -57.0606, 0,  1
27.9722, -78.0291, 0,  1
33.9614, 86.0594, 0,  1
41.304, -93.383, 0, 1
50, -100, 0, 1];


cptx22 = [50, 60, 0, 1
41.5555, 51.5468, 0,  1
34.324, 42.294, 0,  1
28.3053, 32.2417, 0,  1
17.7303, 8.36223, 0,  1
13.48, 18.122, 0,  1
13.2051, 32.8932, 0,  1
16.8462, 57.0606, 0,  1
27.9722, 78.0291, 0,  1
33.9614, 86.0594, 0,  1
41.304, -93.383, 0, 1
50, -100, 0, 1];

cptx22 = [50, 60, 0, 1
41.5555, 51.5468, 0,  1
34.324, 42.294, 0,  1
28.3053, 32.2417, 0,  1
17.7303, 8.36223, 0,  1
13.48, 18.122, 0,  1
15.2051, 32.8932, 0,  1
16.8462, 57.0606, 0,  1
27.9722, 78.0291, 0,  1
33.9614, 86.0594, 0,  1
41.304, -93.383, 0, 1
50, -100, 0, 1];

cptx22 =  [1, 0,0, 1; 
    3, 6,0, 1; 
   5, 6,0, 1; 
    6, 5,0, 1; 
];









cpx2 = cptx22; 

cpx = cpx2.*weights; % (x,y,1)*w, homogenize
ptdim = length(cpx(1,:));

[cpbsB, intvals] = bezierExtractCpts(knot2, p2, cpx); % extract cpts and intervals; 
ncpbs = length(cpbsB(1,1,:)); % patch number


% sample number [-1,1]
xyvalue2(:,:,1)  = zeros(samplen, ptdim-1); 
dvalue2(:,:,1) = zeros(samplen, ptdim-1);
uknot1 = unique(knot2); 
for j = 1:ncpbs
    cpb = cpbsB(:,:,j);
    %plot control polygon;
    % plot(cpb(:,1)./cpb(:,3),cpb(:,2)./cpb(:,3),'--o') % dehomogenize 
    % hold on;         
    %[ps, dps, ddps] = evalBernRational(cpb, p, s0);
    tt = linspace(uknot1(j),uknot1(j+1),samplen);
    [ps, dps, ddps] = evalBern_rational_modify(cpb, p2, uknot1(j), uknot1(j+1), tt);
    
    xyvalue2(:,:,j) = ps;  
    dvalue2(:,:,j) = dps;
    
    % plot 2d or 3d
    if (ptdim-1 == 2)
        plot(ps(:,1),ps(:,2))
    else
        plot3(ps(:,1),ps(:,2),ps(:,3))
    end
      
    hold on
end



%% brute-force, id1, id2, i, j loop 
epsilon = 0.1; 

linex = zeros(samplen,samplen);
liney = zeros(samplen, samplen);
fdot = zeros(samplen,samplen);

kk = 0; 
idset(:,1) = [0,0,0,0];
idset1(:,1) = [0,0,0,0,0];

%figure(3)
hold on; 
vari = [1,2];
for id1 = 1:npatch1
    for id2 = 1:npatch2
        ss0 = uknot0(id1); ss1 = uknot0(id1+1); 
        tt0 = uknot1(id2); tt1 = uknot1(id2+1); 
        
        intervals = [ss0, ss1, tt0, tt1];
        
        cA = cpbsA(:,:,id1)
        cB = cpbsB(:,:,id2)
        
        
        
       %% Newton iteration
        error = 10^(-5);
        no_itr = 20 ;
        
        % Choose the start point 
        % select left left;
        sv = ss0;        
        tv = tt0;   
        
        [st, no_itr, norm1, psqt ] = Newton_rational_modified2_vari(cA, p1, ss0, ss1, sv, cB, p2, tt0, tt1, tv, no_itr, error, vari);
        if norm(psqt(:,1))+norm(psqt(:,2))>0.000001
            if (ptdim-1 == 2)
                plot(psqt(:,1),psqt(:, 2),'--*');
            else
                plot3(psqt(:,1),psqt(:, 2),psqt(:,3),'--*');
            end
        end
        
        
        % change different start point  % select left right;
        sv = ss0;
        tv = tt1; 
        [st, no_itr, norm1, psqt ] = Newton_rational_modified2_vari(cA, p1, ss0, ss1, sv, cB, p2, tt0, tt1, tv, no_itr, error, vari);
        if norm(psqt(:,1))+norm(psqt(:,2))>0.000001
            if (ptdim-1 == 2)
                plot(psqt(:,1),psqt(:, 2),'--*');
            else
                plot3(psqt(:,1),psqt(:, 2),psqt(:,3),'--*');
            end
        end
        
        % change different start point  % select right left;
        sv = ss1;
        tv = tt0; 
        
        [st, no_itr, norm1, psqt ] = Newton_rational_modified2_vari(cA, p1, ss0, ss1, sv, cB, p2, tt0, tt1, tv, no_itr, error, vari);
        if norm(psqt(:,1))+norm(psqt(:,2))>0.000001
            if (ptdim-1 == 2)
                plot(psqt(:,1),psqt(:, 2),'--*');
            else
                plot3(psqt(:,1),psqt(:, 2),psqt(:,3),'--*');
            end
        end
        
        % change different start point  % select right right;
        sv = ss1;
        tv = tt1; 
        
        [st, no_itr, norm1, psqt ] = Newton_rational_modified2_vari(cA, p1, ss0, ss1, sv, cB, p2, tt0, tt1, tv, no_itr, error, vari);
        if norm(psqt(:,1))+norm(psqt(:,2))>0.000001
            if (ptdim-1 == 2)
                plot(psqt(:,1),psqt(:, 2),'--*');
            else
                plot3(psqt(:,1),psqt(:, 2),psqt(:,3),'--*');
            end
        end
        
        
    end
end



hold off; 