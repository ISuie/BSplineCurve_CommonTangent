clc;
clear;
close all
%    bsn - number of control points - 1
%    p - spline degree
%    ut - parametric point
%    U - knot sequence

%% rational B-spline 1
knot=[0, 0, 0, 0, 1/3, 2/3, 1,1,1,1];

p = 3;
bsn = length(knot)-p-2;

npatch = length(unique(knot))-1; 
% set control points for b-spline
% weights = 1 

weights = [2; 2; 3; 4; 5; 1];
weights = [1; 1; 2; 1; 4; 1];
cptx = [-5, 0, 1; 
    2, 2, 1; 
    3, -3, 1; 
    5, -7, 1; 
    6, -6, 1; 
    8, -3, 1];
% cptx = [-5, 0, 0, 1; 
%         2, 6, 0, 1; 
%         3, -3, 0, 1;
%         5, 0, 0, 1; 
%         8, -2, 0,1;
%         4, -5, 0, 1];

cpx = cptx.*weights; % (x,y,1)*w, homogenize
ptdim = length(cpx(1,:));

[cpbsA, intvals] = bezierExtractCpts(knot, p, cpx); % extract cpts and intervals; 
ncpbs = length(cpbsA(1,1,:)); % patch number

figure(1)
% sample number [-1,1]
samplen = 50;
xyvalue(:,:,1)  = zeros(samplen, ptdim-1); 
dvalue(:,:,1) = zeros(samplen, ptdim-1);

uknot0 = unique(knot);
for j = 1:ncpbs
    cpb = cpbsA(:,:,j);
    %plot control polygon;
%     plot(cpb(:,1)./cpb(:,3),cpb(:,2)./cpb(:,3),'--o') % dehomogenize 
%     hold on;         
    %[ps, dps, ddps] = evalBernRational(cpb, p, s0);
    ss = linspace(uknot0(j),uknot0(j+1),samplen);
    [ps, dps, ddps] = evalBern_rational_modify(cpb, p, uknot0(j), uknot0(j+1), ss);
    
    xyvalue(:,:,j) = ps;  
    dvalue(:,:,j) = dps;
    plot(ps(:,1),ps(:,2))
    % plot3(ps(:,1),ps(:,2),ps(:,3))
    %axis equal    
    hold on
end

%% rational B-spline 2
knot=[0, 0, 0, 0, 1/3, 2/3, 1,1,1,1];
p = 3;
bsn = length(knot)-p-2;

npatch2 = length(unique(knot))-1; 
% set control points for b-spline
% weights = 1 
weights = [1; 4; 3; 1; 1; 1];
weights = [1; 1; 4; 3; 1; 1];
cpx2 = [-5, 16, 1; -4, 8, 1; -3, 8, 1; 0, 6, 1; 1, 5, 1; 6, 7, 1];
% cpx2 = [-5, 16, 0, 1;
%         -4, 12, 0, 1; 
%         -3, 12, 0, 1; 
%         0, 7, 0, 1; 
%         1, 4, 0, 1; 
%         6, 6, 0, 1];

cpx = cpx2.*weights; % (x,y,1)*w, homogenize
ptdim = length(cpx(1,:));

[cpbsB, intvals] = bezierExtractCpts(knot, p, cpx); % extract cpts and intervals; 
ncpbs = length(cpbsB(1,1,:)); % patch number


% sample number [-1,1]
xyvalue2(:,:,1)  = zeros(samplen, ptdim-1); 
dvalue2(:,:,1) = zeros(samplen, ptdim-1);
uknot1 = unique(knot); 
for j = 1:ncpbs
    cpb = cpbsB(:,:,j);
    %plot control polygon;
    % plot(cpb(:,1)./cpb(:,3),cpb(:,2)./cpb(:,3),'--o') % dehomogenize 
    % hold on;         
    %[ps, dps, ddps] = evalBernRational(cpb, p, s0);
    tt = linspace(uknot1(j),uknot1(j+1),samplen);
    [ps, dps, ddps] = evalBern_rational_modify(cpb, p, uknot1(j), uknot1(j+1), tt);
    
    xyvalue2(:,:,j) = ps;  
    dvalue2(:,:,j) = dps;
    plot(ps(:,1),ps(:,2))
    %plot3(ps(:,1),ps(:,2),ps(:,3))
      
    hold on
end


%% brute-force, id1, id2, i, j loop 
epsilon = 0.06; 

linex = zeros(samplen,samplen);
liney = zeros(samplen, samplen);
fdot = zeros(samplen,samplen);

kk = 0; 
idset(:,1) = [0,0,0,0];
idset1(:,1) = [0,0,0,0,0];
%figure(3)
hold on; 
for id1 = 1:npatch
    for id2 = 1:npatch2
        
        for i = 1:samplen
            for j = 1:samplen
                linex(i,j) = xyvalue(i,1,id1)-xyvalue2(j,1,id2);
                liney(i,j) = xyvalue(i,2,id1)-xyvalue2(j,2,id2);
            end
        end    

        
        tm1(1) = 0.0;
        for i = 1:samplen
            for j = 1:samplen
                nv0 = norm([linex(i,j),liney(i,j)]);
                nv1 = norm([dvalue2(j,1,2),dvalue2(j,2,2)]); %%if the point is singular, need to delete?
                tm0 = det([linex(i,j),liney(i,j); dvalue2(j,1,id2),dvalue2(j,2,id2)]);
                tm0 = abs(tm0)/(nv0*nv1);
                if(tm0 < epsilon)
                    tmm0 = det([linex(i,j),liney(i,j); dvalue(i,1,id1),dvalue(i,2,id1)]);
                    tmm0 = abs(tmm0)/(nv0*nv1);
                    if(tmm0 < epsilon)
                        [tm0, tmm0];
                        kk = kk +1; 
                        idset(:, kk) = [id1, id2, i, j];  %current output, push to a matrix
                        idset1(:, kk) = [id1, id2, i, j, tm0+tm1]; 
                        %plot co-tangent lines
                        %plot([xyvalue(i,1,id1),xyvalue2(j,1,id2)],[xyvalue(i,2,id1),xyvalue2(j,2,id2)],'--');
                        %plot3([xyvalue(i,1,id1),xyvalue2(j,1,id2)],[xyvalue(i,2,id1),xyvalue2(j,2,id2)], [xyvalue(i,3,id1),xyvalue2(j,3,id2)],'--');
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
   

for pid1 = 1:3
    for pid2 = 1:3
        idset2 = idset(:,(find(idset(1,:) == pid1)));
        idset23 = idset2(:,(find(idset2(2,:) == pid2)));
        
        ss0 = uknot0(pid1); ss1 = uknot0(pid1+1); 
        tt0 = uknot1(pid2); tt1 = uknot1(pid2+1); 
        
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
            [st, no_itr, norm1, psqt ] = Newton_rational_modified(cA, p, ss0, ss1, sv, cB, p, tt0, tt1, tv, no_itr, error);
            if norm(psqt(:,1))+norm(psqt(:,2))>0.000001
                plot(psqt(:,1),psqt(:, 2),'--*');
                %plot3(psqt(:,1),psqt(:, 2),psqt(:,3),'--*');
            end
        end
    end
end
end

hold off; 











