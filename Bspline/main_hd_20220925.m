clc;
clear;
close all
%    bsn - number of control points - 1
%    p - spline degree
%    ut - parametric point
%    U - knot sequence

%% rational B-spline 1
knot1 =[0, 0, 0, 0, 1/3, 2/3, 1, 1, 1, 1];
knot1 = [0,0,0,0,1,1,1,28.2843,28.2843,28.2843,95.3663,95.3663,95.3663,153.676,153.676,153.676,203.676,203.676,203.676,246.102,246.102,246.102,246.102,246.102];
knot21 =[0 0 0 0 0 0 50.9902 50.9902 50.9902 118.072 118.072 118.072 162.794 162.794 162.794 162.794 162.794 162.794];
knot31 = [0 0 0 0 0 0 28.2843 28.2843 28.2843 95.3663 95.3663 95.3663 153.676 153.676 153.676 203.676 203.676 203.676 246.102 246.102 246.102 246.102 246.102 246.102];
knot1 = knot31; 
knot1 = knot21; 


p1 = 5;
bsn1 = length(knot1)-p1-1;

npatch = length(unique(knot1))-1; 
% set control points for b-spline
% weights = 1 

weights = [2; 2; 3; 4; 5; 1];
weights = [1; 1; 2; 1; 4; 1];
weights = ones(bsn1,1);

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

cptx = cptx21; 


    
ptdim = length(cptx(1,:));
cptn = length(cptx(:,1));

cpx = cptx.*weights; % (x,y,1)*weight, homogenize
ptdim = length(cpx(1,:));



[cpbsA, intvals] = bezierExtractCpts(knot1, p1, cpx); % extract cpts and intervals; 
ncpbs1 = length(cpbsA(1,1,:)); % patch number

figure(1)
% sample number [-1,1]
samplen = 50;

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
knot2 =knot22; 
knot2 = knot22; 

p2 = 5;
bsn = length(knot2)-p2-1;

npatch2 = length(unique(knot2))-1; 
% set control points for b-spline
% weights = 1 
weights = ones(bsn,1);





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
for id1 = 1:npatch1
    for id2 = 1:npatch2
        
        
        for i = 1:samplen
            for j = 1:samplen
                %curve1_pt = xyvalue1(i,:,id1);
                %curve2_pt = xyvalue2(j,:,id2);
                %dcurve1_pt = dvalue1(i,:,id1);
                %dcurve2_pt = dvalue2(i,:,id1);
                linexyz = xyvalue1(i,:,id1)-xyvalue2(j,:,id2);
                nv0 = norm(linexyz);
                nv1 = norm(dvalue2(j,:,id2)); %%if the point is singular, need to delete?                
                tm0 = det_nd(linexyz, dvalue2(j,:,id2));                 
                tm0 = abs(tm0)/(nv0*nv1);
                if(tm0 < epsilon)
                    tmm0 = det_nd(linexyz, dvalue1(i,:,id1));
                    %det([linex(i,j),liney(i,j); dvalue(i,1,id1),dvalue(i,2,id1)]);
                    tmm0 = abs(tmm0)/(nv0*nv1);
                    if(tmm0 < epsilon)
                        %[i,j]
                        %[tm0, tmm0]
                        kk = kk +1; 
                        idset(:, kk) = [id1, id2, i, j];  %current output, push to a matrix
                        idset1(:,kk) = [id1,id2,i,j,tm0+tmm0]; 
                        
                        %idset1(:, kk) = [id1, id2, i, j, tm0+tm1]; 
                        %plot co-tangent lines
                        % plot 2d or 3d
                        if (ptdim-1 == 2)
                          %plot([xyvalue1(i,1,id1),xyvalue2(j,1,id2)],[xyvalue1(i,2,id1),xyvalue2(j,2,id2)],'--');
                        else
                          %plot3([xyvalue1(i,1,id1),xyvalue2(j,1,id2)],[xyvalue1(i,2,id1),xyvalue2(j,2,id2)], [xyvalue1(i,3,id1),xyvalue2(j,3,id2)],'--');
                        end

                        hold on;                         
                        %idset(kk,1) = [i,j];
                    end
                end        

            end
        end
        
    end
end



%% find the patches id1 = 2; id2 = 3
isNewton = 1; 
if (isNewton ==1)
vari = [1,2];

for pid1 = 1:npatch1
    for pid2 = 1:npatch2
        idset2 = idset(:,(find(idset(1,:) == pid1)));
        idset23 = idset2(:,(find(idset2(2,:) == pid2))); 

        ss0 = uknot0(pid1); ss1 = uknot0(pid1+1); 
        tt0 = uknot1(pid2); tt1 = uknot1(pid2+1); 
        
        intervals = [ss0, ss1, tt0,tt1];
        
        tii = int64(round(length(idset23)/4));
        if (~isempty(idset23))            
            sids = idset23(:,tii)';

            cA = cpbsA(:,:,sids(1));
            si = sids(3); 
            sv = ss0 + (ss1-ss0)/samplen*si; 
            cB = cpbsB(:,:,sids(2));
            ti =  sids(2); 
            tv = tt0 + (tt1-tt0)/samplen*ti;          

            error = 10^(-5);
            no_itr = 20 ;
            %[st, no_itr, norm1, psqt ] = Newton_rational_modified(cA, p, ss0, ss1, sv, cB, p, tt0, tt1, tv, no_itr, error);
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
end
end

hold off; 

