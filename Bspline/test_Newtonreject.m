clc;
clear;
close all

%% rational B-spline 1
knot1=[0,0,0,0,1,1,1,1];
p1 = 3;
bsn1 = length(knot1)-p1-2;

npatch1 = length(unique(knot1))-1; 
% set control points for b-spline
% weights = 1 
weights1 = [1; 1/3; 1/3; 1;];
cptx1 = [2,0, 1; 
   2, 4, 1; 
    -2, 4, 1; 
   -2, 0, 1;

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

Pknot1=[ ];

for j = 1:ncpbs1
    cpb1 = cpbsA1(:,:,j);
    %plot control polygon;

    tt1 = linspace(uknot1(j),uknot1(j+1),samplen);
    %[ps, dps, ddps] = evalBernRational(cpb, p, s0);
    %[ps, dps, ddps] = evalBern_rational_s0s1(cpb, p, uknot(j), uknot(j+1), tt);
    [ps1, dps1, ddps1] = evalBern_rational_modify(cpb1, p1, uknot1(j), uknot1(j+1), tt1);
    [pointx1,pointy1,dpointx1,dpointy1,pknot1] = InfectionPoints (cpb1,p1,uknot1(j),uknot1(j+1));
        scatter(pointx1,pointy1,'filled');
   for i= 1:length(pknot1)%将节点在整段曲线的参数值列成数组
            Pknot1=[Pknot1,pknot1(i)*(uknot1(j+1)-uknot1(j))+uknot1(j)];
   end
 
 
    xyvalue1(:,:,j) = ps1;  
    dvalue1(:,:,j) = dps1;
    %axis equal    
    hold on
    
    plot(ps1(:,1),ps1(:,2));

    

    
end
for i = 1:length(Pknot1)
    [knot1, cpx1] = knotInsertion(knot1,cpx1,p1, Pknot1(i));
 end
 [cpbsA1, intvals1] = bezierExtractCpts(knot1, p1, cpx1); 
 ncpbs1 = length(cpbsA1(1,1,:));
%% rational B-spline 2
knot2=[0, 0, 0, 0,1,1,1,1];
p2 =3;
bsn2 = length(knot2)-p2-2;

npatch2 = length(unique(knot2))-1; 
% set control points for b-spline
% weights = 1 

weights2 = [1; 1/3; 1/3; 1;];
cptx2 = [-2,10,1; 
  -2,6, 1; 
  2, 6,1; 
 2,10,1;




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

Pknot2=[ ];

for j = 1:ncpbs2
    cpb2 = cpbsA2(:,:,j);
    %plot control polygon;

    tt2 = linspace(uknot2(j),uknot2(j+1),samplen);
    %plot(cpb2(:,1)./cpb2(:,3),cpb2(:,2)./cpb2(:,3),'--o') % dehomogenize 
    hold on;    
    %[ps, dps, ddps] = evalBernRational(cpb, p, s0);
    %[ps, dps, ddps] = evalBern_rational_s0s1(cpb, p, uknot(j), uknot(j+1), tt);
    [ps2, dps2, ddps2] = evalBern_rational_modify(cpb2, p2, uknot2(j), uknot2(j+1), tt2);
    [pointx2,pointy2,dpointx2,dpointy2,pknot2] = InfectionPoints (cpb2,p2,uknot2(j),uknot2(j+1));
    scatter(pointx2,pointy2,'filled');
    hold on;

[cpbsA2, intvals2] = bezierExtractCpts(knot2, p2, cpx2);
   for i= 1:length(pknot2)%将节点在整段曲线的参数值列成数组
        Pknot2=[Pknot2,pknot2(i)*(uknot2(j+1)-uknot2(j))+uknot2(j)];
   end
    
    

     xyvalue2(:,:,j) = ps2;  
    dvalue2(:,:,j) = dps2;

    plot(ps2(:,1),ps2(:,2));

    %axis equal    
    hold on


end
 for i = 1:length(Pknot2)
    [knot2, cpx2] = knotInsertion(knot2,cpx2,p2, Pknot2(i));
 end
 [cpbsA2, intvals2] = bezierExtractCpts(knot2, p2, cpx2); 
 ncpbs2 = length(cpbsA2(1,1,:));
%for j=1:ncpbs2
    %cpb2 = cpbsA2(:,:,j);
    %plot control polygon;
    %plot(cpb2(:,1)./cpb2(:,3),cpb2(:,2)./cpb2(:,3),'--o')
    % dehomogenize 
    %hold on;     
%end
%% reject
rejection = zeros(length(cpbsA1(1,1,:)),length(cpbsA2(1,1,:)));
uknot1 = unique(knot1);
uknot2 = unique(knot2);
vari = [1,2];
error = 10^(-5);
no_itr = 20 ;
for i1 = 1 : length(cpbsA1(1,1,:))
    bknot1 = [uknot1(i1),uknot1(i1+1)];
    bcpb1 = [cpbsA1(:,:,i1)];
    for i2 = 1 : length(cpbsA2(1,1,:))
        bknot2 = [uknot2(i2),uknot2(i2+1)];
        bcpb2 = [cpbsA2(:,:,i2)];
        [result,dcpb1,dknot1,dcpb2,dknot2]=reject(p1,p2,bcpb1,bcpb2,bknot1,bknot2);
        rejection(i1,i2)=result;
        if result == 1
            %[x11,y11,k11] = draw(p1,bcpb1,bknot1,dknot1(1,1));
            %[x21,y21,k21] = draw(p2,bcpb2,bknot2,dknot2(1,1));
            %[x12,y12,k12] = draw(p1,bcpb1,bknot1,dknot1(1,2));
            %[x22,y22,k22] = draw(p2,bcpb2,bknot2,dknot2(1,2));
            %plot([x11,x21],[y11,y21]);
            %plot([x12,x22],[y12,y22]);
            if isempty(dcpb1)==0&&isempty(dcpb2)==0
            [sknot1,sknot2,scpb1,scpb2] = bisection3(p1,p2,dcpb1,dcpb2,dknot1,dknot2);
            if isempty(sknot1)==0
            for j1 = 1 : length(sknot1(:,1))
            ptdim = length(scpb1(1,:,j1));
            [st, no_itr, norm1, psqt] = Newton_rational_modified2_vari(scpb1(:,:,j1), p1, sknot1(j1,1), sknot1(j1,2), (sknot1(j1,1)+sknot1(j1,2))/2,scpb2(:,:,j1), p2, sknot2(j1,1), sknot2(j1,2), (sknot2(j1,1)+sknot2(j1,2))/2, no_itr, error, vari);
            if norm(psqt(:,1))+norm(psqt(:,2))>0.000001
            if (ptdim-1 == 2)
            plot(psqt(:,1),psqt(:, 2),'--*');
            else
            plot3(psqt(:,1),psqt(:, 2),psqt(:,3),'--*');
            end
            end
            end
            end
            else
           [x1,y1,k1] = draw(p1,bcpb1,bknot1,dknot1(1));
           [x2,y2,k2] = draw(p2,bcpb2,bknot2,dknot2(1));
           err = (abs(k1-(y2-y1)/(x2-x1))+abs(k2-(y2-y1)/(x2-x1)))/2;
           plot([x1,x2],[y1,y2],'--*');   
            end
        end
    end
end