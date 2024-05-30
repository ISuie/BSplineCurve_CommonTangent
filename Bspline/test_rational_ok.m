clc;
clear;
close all
%    bsn - number of control points - 1
%    p - spline degree
%    ut - parametric point
%    U - knot sequence

%% rational B-spline 1
knot1=[0, 0, 0, 0, 1/5, 2/3, 1,1,1,1];
p1 = 3;
bsn1 = length(knot1)-p1-2;

npatch1 = length(unique(knot1))-1; 
% set control points for b-spline
% weights = 1 

weights1 = [2; 2; 3; 4; 5; 1];
weights1 = [1; 2; 1; 1; 1; 1];
cptx1 = [-5, 0, 1; 
    2, 6, 1; 
    3, -3, 1; 
    5, 0, 1; 
    8, 2, 1; 
    5, -6, 1];

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

Pknot1=[ ];

for j = 1:ncpbs1
    cpb1 = cpbsA1(:,:,j);
    %plot control polygon;
    plot(cpb1(:,1)./cpb1(:,3),cpb1(:,2)./cpb1(:,3),'--o') % dehomogenize 
    hold on;    
    tt1 = linspace(uknot1(j),uknot1(j+1),samplen);
    %[ps, dps, ddps] = evalBernRational(cpb, p, s0);
    %[ps, dps, ddps] = evalBern_rational_s0s1(cpb, p, uknot(j), uknot(j+1), tt);
    [ps1, dps1, ddps1] = evalBern_rational_modify(cpb1, p1, uknot1(j), uknot1(j+1), tt1);
    [pointx1,pointy1,dpointx1,dpointy1,pknot1] = InfectionPoints (cpb1,p1,uknot1(j),uknot1(j+1));
    
   for i= 1:length(pknot1)%将节点在整段曲线的参数值列成数组
            Pknot1=[Pknot1,pknot1(i)*(uknot1(j+1)-uknot1(j))+uknot1(j)];
   end
 
    
    
    scatter(pointx1,pointy1,'filled');
    hold on;
    
    if(j==1)%录入首端点的值和一阶导
        dpointX1=[dps1(1,1)];
        dpointY1=[dps1(1,2)];
        pointX1=[ps1(1,1)];
        pointY1=[ps1(1,2)];
    end
   
    %录入所有端点的值和一阶导
    dpointX1=[dpointX1 dpointx1];
    dpointY1=[dpointY1 dpointy1];
    pointX1=[pointX1 pointx1];
    pointY1=[pointY1 pointy1];
    
     if(j==ncpbs1)%录入尾端点的值和一阶导
          dpointX1=[dpointX1 dps1(samplen,1)];
          dpointY1=[dpointY1 dps1(samplen,2)];
          pointX1=[pointX1 ps1(samplen,1)];
          pointY1=[pointY1 ps1(samplen,2)];
     end
    xyvalue1(:,:,j) = ps1;  
    dvalue1(:,:,j) = dps1;
    plot(ps1(:,1),ps1(:,2))
    %axis equal    
    hold on
end

%% rational B-spline 2
knot2=[0, 0, 0, 0, 1/5, 2/3, 1,1,1,1];
p2 = 3;
bsn2 = length(knot2)-p2-2;

npatch2 = length(unique(knot2))-1; 
% set control points for b-spline
% weights = 1 

weights2 = [2; 2; 3; 4; 5; 1];
weights2 = [1; 2; 1; 1; 1; 1];
cptx2 = [-2, 0, 1; 
    2, 6, 1; 
    4, 8, 1; 
    1, 3, 1; 
    3, 4, 1; 
    9, 1, 1];

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

Pknot2=[ ];

for j = 1:ncpbs2
    cpb2 = cpbsA2(:,:,j);
    %plot control polygon;
    plot(cpb2(:,1)./cpb2(:,3),cpb2(:,2)./cpb2(:,3),'--o') % dehomogenize 
    hold on;    
    tt2 = linspace(uknot2(j),uknot2(j+1),samplen);
    %[ps, dps, ddps] = evalBernRational(cpb, p, s0);
    %[ps, dps, ddps] = evalBern_rational_s0s1(cpb, p, uknot(j), uknot(j+1), tt);
    [ps2, dps2, ddps2] = evalBern_rational_modify(cpb2, p2, uknot2(j), uknot2(j+1), tt2);
    [pointx2,pointy2,dpointx2,dpointy2,pknot2] = InfectionPoints (cpb2,p2,uknot2(j),uknot2(j+1));
    scatter(pointx2,pointy2,'filled');
    hold on;
    
   for i= 1:length(pknot2)%将节点在整段曲线的参数值列成数组
        Pknot2=[Pknot2,pknot2(i)*(uknot2(j+1)-uknot2(j))+uknot2(j)];
   end
    
    if(j==1)%录入首端点的一阶导
        dpointX2=[dps2(1,1)];
        dpointY2=[dps2(1,2)];
        pointX2=[ps2(1,1)];
        pointY2=[ps2(1,2)];
    end
    %录入所有端点的一阶导
    dpointX2=[dpointX2 dpointx2];
    dpointY2=[dpointY2 dpointy2];
    pointX2=[pointX2 pointx2];
    pointY2=[pointY2 pointy2];
    
    
    if(j==ncpbs2)%录入尾端点的一阶导
          dpointX2=[dpointX2 dps2(samplen,1)];
          dpointY2=[dpointY2 dps2(samplen,2)];
          pointX2=[pointX2 ps2(samplen,1)];
          pointY2=[pointY2 ps2(samplen,2)];
     end
    
    xyvalue2(:,:,j) = ps2;  
    dvalue2(:,:,j) = dps2;
    plot(ps2(:,1),ps2(:,2))
    %axis equal    
    hold on
end


%% Rejection criteria 
[curvedr]= direction(dpointX1,dpointY1,dpointX2,dpointY2);%方向的判断数组，0是正向，1是反向
kx1=dpointY1./dpointX1;

for i = 1:length(Pknot2)
    [knot2, cpx2] = knotInsertion(knot2,cpx2,p2, Pknot2(i));
end
[cpbsA2, intvals2] = bezierExtractCpts(knot2, p2, cpx2);

uknot2=unique(knot2);

for i = 1:length(Pknot1)
    [knot1, cpx1] = knotInsertion(knot1,cpx1,p1, Pknot1(i));
end
[cpbsA1, intvals1] = bezierExtractCpts(knot1, p1, cpx1);

uknot1=unique(knot1);

array1(1,1)=1;
array1(length(pointX1)-1,2)=length(uknot1)-1;
for i1=1:length(Pknot1)%按照拐点分控制多边形的控制点
    for i2=1:length(uknot1)
       if(uknot1(i2)==Pknot1(i1))
           right=i2-1;
           left=i2;
           array1(i1,2)=right;
           array1(i1+1,1)=left;
       end
    end
end


[rejectresult,kArray]=Rejection(kx1,pointX1,pointY1,pointX2,cpbsA2,uknot2,Pknot2,curvedr);

%% Bisection method

for i1 = 1:size(rejectresult,1)
    for i2 = 1:size(rejectresult,2)
        
        if rejectresult(i1,i2)== 1
            array2 = kArray(i2,:);
            k=1;
            knot = [ ];
            for k1= array2(1,1):array2(1,2)
                cpbs(:,:,k)=cpbsA2(:,:,k1);
                knot=[knot,uknot2(k1)];
                k=k+1;
            end
            x1 = [pointX1(i1),pointX1(i1+1)];
            y1 = [pointY1(i1),pointX1(i1+1)];
            kx = [kx1(i1),kx1(i1+1)];
            dr = curvedr(i1,i2);
            [px,py] = Bisection(p2,kx,x1,y1,cpbs,knot,dr);
            
            
            for i3=array1(i1,1):array1(i1,2)
            tt = linspace(uknot1(i3),uknot1(i3+1),1e4);
            cpbs1 = cpbsA1(:,:,i3);
            [ps1, dps1, ddps1] = evalBern_rational_modify(cpbs1, p1, uknot1(i3), uknot1(i3+1), tt);
           
            for j1 = 1:length(ps1(:,1))
                for j2 = 1 : length(px)
                    if ((py(j2)-ps1(j1,2))/(px(j2)-ps1(j1,1)))==(dps1(j1,2)/dps1(j1,1))
                        line([ps1(j1,1),px(j2)],[ps1(j1,2),py(j2)]);
                    end
                end
            end
           
            end
        end
    end
end

            
