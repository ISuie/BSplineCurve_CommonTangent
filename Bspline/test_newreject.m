clc;
clear;
close all

%% rational B-spline 1
knot1=[0 0 0 0 0 0 50.9902 50.9902 50.9902 118.072 118.072 118.072 162.794 162.794 162.794 162.794 162.794 162.794];
knot1=[0 0 0 0 0 0 48.433 48.433 48.433 98.764 98.764 98.764 145.674 145.674 145.674 145.674 145.674 145.674];
knot1=[0 0 0 0 0 0 47.562 47.562 47.562 77.888 77.888 77.888 198.452 198.452 198.452 198.452 198.452 198.452];
knot1=[0 0 0 0 0 0 35.982 35.982 35.982 56.783 56.783 56.783 157.385 157.385 157.385 157.385 157.385 157.385];
knot1=[0 0 0 0 0 0 26.873 26.873 26.873 72.783 72.783 72.783 145.385 145.385 145.385 145.385 145.385 145.385];
knot1=[0 0 0 0 0 0 18.982 18.982 18.982 58.783 58.783 58.783 163.385 163.385 163.385 163.385 163.385 163.385];
knot1=[0 0 0 0 0 0 28.982 28.982 28.982 63.783 63.783 63.783 157.385 157.385 157.385 157.385 157.385 157.385];
p1 = 5;
bsn1 = length(knot1)-p1-1;
npatch1 = length(unique(knot1))-1; 
% set control points for b-spline
% weights = 1 
weights1 = ones(bsn1,1);
cptx1 = [-70, -80, 0, 1;
-57.8176, -69.4587, 0, 1;
-62.6375, -59.1928, 0, 1;
-64.4596, -49.2025, 0, 1;
1.7374, 26.7069, 0, 1;
2.4536, -5.42976, 0,  1;
10.4531, 6.37526, 0,  1;
13.674, -26.0019, 0,  1;
30.0786, 45.8306, 0,  1;
33.9675, 53.8246, 0,  1;
40.6079, 61.8811, 0,  1;
50, 70, 0,  1];
cptx1 = [-50, -80, 0, 1;
-57.8176, -69.4587, 0, 1;
-64.0098, -59.1928, 0, 1;
-64.4596, -49.2025, 0, 1;
1.7374, -26.7069, 0, 1;
-47.7101, -5.42976, 0,  1;
-38.1165, -7.8656, 0,  1;
-27.2355, 26.0019, 0,  1;
-30.0786, 36.987, 0,  1;
-36.9675, 53.8246, 0,  1;
-40.6079, 75.9986, 0,  1;
-50, 70, 0,  1];
cptx1 = [-50, -80, 0, 1;
-57.8176, -69.4587, 0, 1;
-64.0098, -59.1928, 0, 1;
-64.4596, -49.2025, 0, 1;
1.7374, -26.7069, 0, 1;
-47.7101, -5.42976, 0,  1;
-38.1165, -7.8656, 0,  1;
-27.2355, 26.0019, 0,  1;
-30.0786, 36.987, 0,  1;
-36.9675, 53.8246, 0,  1;
-40.6079, 75.9986, 0,  1;
-50, 70, 0,  1];
cptx1 = [-50, -80, 0, 1;
-57.8176, -69.4587, 0, 1;
-64.0098, -59.1928, 0, 1;
2.6743, -49.2025, 0, 1;
1.7374, -26.7069, 0, 1;
5.8932, -5.42976, 0,  1;
-38.1165, -7.8656, 0,  1;
-27.2355, 26.0019, 0,  1;
-30.0786, 36.987, 0,  1;
-36.9675, 53.8246, 0,  1;
-40.6079, 75.9986, 0,  1;
-50, 70, 0,  1];
cptx1 = [-50, -80, 0, 1;
-57.8176, -69.4587, 0, 1;
-64.0098, -59.1928, 0, 1;
2.6743, -49.2025, 0, 1;
1.7374, -26.7069, 0, 1;
5.8932, -5.42976, 0,  1;
-38.1165, -7.8656, 0,  1;
-27.2355, -26.0019, 0,  1;
-32.0786, 30.894, 0,  1;
-36.9675, 53.8246, 0,  1;
-40.6079, 75.9986, 0,  1;
-50, 70, 0,  1];
cptx1 = [-50, -80, 0, 1;
-57.8176, -69.4587, 0, 1;
-64.0098, -59.1928, 0, 1;
2.6743, -49.2025, 0, 1;
1.7374, -26.7069, 0, 1;
5.8932, -5.42976, 0,  1;
38.1165, -7.8656, 0,  1;
27.2355, -26.0019, 0,  1;
32.0786, 30.894, 0,  1;
-35.9675, 53.8246, 0,  1;
-40.6079, 75.9986, 0,  1;
-50, 70, 0,  1];
cptx1 = [-50, -80, 0, 1;
-57.8176, -69.4587, 0, 1;
-64.0098, -59.1928, 0, 1;
2.6743, -49.2025, 0, 1;
1.7374, -26.7069, 0, 1;
5.8932, -5.42976, 0,  1;
38.1165, -7.8656, 0,  1;
-27.2355, 26.0019, 0,  1;
32.0786, 30.894, 0,  1;
-35.9675, 53.8246, 0,  1;
-40.6079, 75.9986, 0,  1;
-50, 70, 0,  1];
cpx1 = cptx1.*weights1; % (x,y,1)*w, homogenize
ptdim1 = length(cpx1(1,:));
uknot1 = unique(knot1);
[cpbsA1, intvals1] = bezierExtractCpts(knot1, p1, cpx1); % extract cpts and intervals; 
ncpbs1 = length(cpbsA1(1,1,:)); % patch number
figure(1)
% sample number [-1,1]
samplen = 50;
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
        %scatter(pointx1,pointy1,'filled');
   for i= 1:length(pknot1)%将节点在整段曲线的参数值列成数组
            Pknot1=[Pknot1,pknot1(i)*(uknot1(j+1)-uknot1(j))+uknot1(j)];
   end
    xyvalue1(:,:,j) = ps1;  
    dvalue1(:,:,j) = dps1;
    %axis equal    
    hold on
    plot(ps1(:,1),ps1(:,2),'k','Linewidth', 1);
end
for i = 1:length(Pknot1)
    [knot1, cpx1] = knotInsertion(knot1,cpx1,p1, Pknot1(i));
 end
 [cpbsA1, intvals1] = bezierExtractCpts(knot1, p1, cpx1); 
 ncpbs1 = length(cpbsA1(1,1,:));
%% rational B-spline 2
knot2= [0 0 0 0 0 0 58.3095 58.3095 58.3095 128.31 128.31 128.31 178.31 178.31 178.31 178.31 178.31 178.31];
knot2= [0 0 0 0 0 0 43.9876 43.9876 43.9876 98.746 98.746 98.746 145.764 145.764 145.764 145.764 145.764 145.764];
knot2= [0 0 0 0 0 0 47.9876 47.9876 47.9876 98.746 98.746 98.746 145.764 145.764 145.764 145.764 145.764 145.764];
knot2= [0 0 0 0 0 0 33.9876 33.9876 33.9876 56.746 56.746 56.746 154.764 154.764 154.764 154.764 154.764 154.764];
knot2= [0 0 0 0 0 0 33.9876 33.9876 33.9876 56.746 56.746 56.746 154.764 154.764 154.764 154.764 154.764 154.764];
knot2= [0 0 0 0 0 0 43.9876 43.9876 43.9876 67.746 67.746 67.746 136.764 136.764 136.764 136.764 136.764 136.764];
p2 =5;
bsn2 = length(knot2)-p2-1;
npatch2 = length(unique(knot2))-1; 
% set control points for b-spline
% weights = 1 
weights2 = ones(bsn2,1);
cptx2 = [50, 60, 0, 1
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
cptx2 = [50, 60, 0, 1
41.5555, 78.9435, 0,  1
-34.324, 35.294, 0,  1
28.3053, 32.2417, 0,  1
-17.7303, 4.8876, 0,  1
13.48, 15.122, 0,  1
15.2051, 32.8932, 0,  1
16.8462, 57.0606, 0,  1
-27.9722, 78.0291, 0,  1
33.9614, 86.0594, 0,  1
41.304, -93.383, 0, 1
50, -100, 0, 1];
cptx2 = [50, 60, 0, 1
1.456, 3.451, 0,  1
13.564, 22.294, 0,  1
16.3053, 32.2417, 0,  1
-5.872, 50.872, 0,  1
13.484, 15.122, 0,  1
15.2051, 32.8932, 0,  1
-16.8462, 57.0606, 0,  1
27.9722, 78.0291, 0,  1
33.9614, 86.0594, 0,  1
41.304, -93.383, 0, 1
50, -100, 0, 1];
cptx2 = [50, 60, 0, 1
1.456, 3.451, 0,  1
13.564, 22.294, 0,  1
16.3053, 32.2417, 0,  1
-5.872, 50.872, 0,  1
-13.484, 15.122, 0,  1
5.2051, 32.8932, 0,  1
-16.8462, 57.0606, 0,  1
27.9722, 78.0291, 0,  1
33.9614, 86.0594, 0,  1
41.304, -93.383, 0, 1
50, -100, 0, 1];
cptx2 = [50, 60, 0, 1
1.456, 3.451, 0,  1
13.564, 22.294, 0,  1
16.3053, 32.2417, 0,  1
-5.872, 50.872, 0,  1
-13.484, 15.122, 0,  1
5.2051, 32.8932, 0,  1
-16.8462, 57.0606, 0,  1
27.9722, 78.0291, 0,  1
33.9614, 86.0594, 0,  1
41.304, -93.383, 0, 1
50, -100, 0, 1];
cptx2 = [50, 60, 0, 1
1.456, 3.451, 0,  1
13.564, 22.294, 0,  1
16.3053, 32.2417, 0,  1
-5.872, 50.872, 0,  1
-13.484, 15.122, 0,  1
5.2051, 32.8932, 0,  1
-16.8462, 57.0606, 0,  1
27.9722, 78.0291, 0,  1
33.9614, 86.0594, 0,  1
41.304, -93.383, 0, 1
50, -100, 0, 1];
cptx2 = [50, 60, 0, 1
1.456, 3.451, 0,  1
13.564, 22.294, 0,  1
16.3053, 32.2417, 0,  1
-5.872, 50.872, 0,  1
-13.484, 15.122, 0,  1
5.2051, 32.8932, 0,  1
16.8462, 57.0606, 0,  1
-27.9722, 78.0291, 0,  1
-33.9614, 86.0594, 0,  1
-41.304, -93.383, 0, 1
50, -100, 0, 1];
cpx2 = cptx2.*weights2; % (x,y,1)*w, homogenize
ptdim2 = length(cpx2(1,:));
uknot2 = unique(knot2);
[cpbsA2, intvals2] = bezierExtractCpts(knot2, p2, cpx2); % extract cpts and intervals; 
ncpbs2 = length(cpbsA2(1,1,:)); % patch number
figure(1)
% sample number [-1,1]
samplen = 50;
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
    %scatter(pointx2,pointy2,'filled');
    hold on;
[cpbsA2, intvals2] = bezierExtractCpts(knot2, p2, cpx2);
   for i= 1:length(pknot2)%将节点在整段曲线的参数值列成数组 
        Pknot2=[Pknot2,pknot2(i)*(uknot2(j+1)-uknot2(j))+uknot2(j)];
   end   
     xyvalue2(:,:,j) = ps2;  
    dvalue2(:,:,j) = dps2;
    plot(ps2(:,1),ps2(:,2),'k','Linewidth', 1);
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
            
%             tt1 = linspace(bknot1(1),dknot1(1),samplen);
%             [ps1, dps1, ddps1] = evalBern_rational_modify(bcpb1, p1, bknot1(1),dknot1(1), tt1);
%             tt2 = linspace(bknot2(1),dknot2(1),samplen);
%             [cpx1,cpx2,knot1,knot2] = Divide(bcpb2,bknot2,dknot2(1),p2);
%             [ps2, dps2, ddps2] = evalBern_rational_modify(cpx1, p2,bknot2(1),dknot2(1), tt2);
%             plot(ps1(:,1),ps1(:,2),'linestyle','- -');
%             plot(ps2(:,1),ps2(:,2),'linestyle','- -');
%             
%             tt3 = linspace(dknot1(1),dknot1(2),samplen);
%             [ps3, dps3, ddps3] = evalBern_rational_modify(dcpb1, p1, dknot1(1),dknot1(2), tt3);
%             tt4 = linspace(dknot2(1),dknot2(2),samplen);
%             [ps4, dps4, ddps4] = evalBern_rational_modify(dcpb2, p2,dknot2(1),dknot2(2), tt4);
%             plot(ps3(:,1),ps3(:,2));
%             plot(ps4(:,1),ps4(:,2));
%             
%             tt5 = linspace(dknot1(2),bknot1(2),samplen);
%             [ps5, dps5, ddps5] = evalBern_rational_modify(bcpb1, p1,dknot1(2),bknot1(2), tt5);
%             tt6 = linspace(dknot2(2),bknot2(2),samplen);
%             [cpx1,cpx2,knot1,knot2] = Divide(bcpb2,bknot2,dknot2(2),p2);
%             [ps6, dps6, ddps6] = evalBern_rational_modify(cpx2, p2,dknot2(2),bknot2(2), tt6);
%             plot(ps5(:,1),ps5(:,2),'linestyle','- -');
%             plot(ps6(:,1),ps6(:,2),'linestyle','- -');
            
            if isempty(sknot1)==0
            [cknot1,cknot2] = choose(p1,p2,bknot1,bknot2,bcpb1,bcpb2,sknot1,sknot2);
            for j1 = 1:length(cknot1)
            [x1,y1,k1] = draw(p1,bcpb1,bknot1,cknot1(j1));
            [x2,y2,k2] = draw(p2,bcpb2,bknot2,cknot2(j1));
            err = (abs(k1-(y2-y1)/(x2-x1))+abs(k2-(y2-y1)/(x2-x1)))/2;
            plot([x1,x2],[y1,y2],'-o');
            %for j1 = 1 : length(sknot1(:,1))
            %ptdim = length(scpb1(1,:,j1));
            %[st, no_itr, norm1, psqt] = Newton_rational_modified2_vari(scpb1(:,:,j1), p1, sknot1(j1,1), sknot1(j1,2), (sknot1(j1,1)+sknot1(j1,2))/2,scpb2(:,:,j1), p2, sknot2(j1,1), sknot2(j1,2), (sknot2(j1,1)+sknot2(j1,2))/2, no_itr, error, vari);
            %if norm(psqt(:,1))+norm(psqt(:,2))>0.000001
            %if (ptdim-1 == 2)
            %plot(psqt(:,1),psqt(:, 2),'--*');
            %else
            %plot3(psqt(:,1),psqt(:, 2),psqt(:,3),'--*');
            %end
            %end
            end
            end
            else
           [x1,y1,k1] = draw(p1,bcpb1,bknot1,dknot1(1));
           [x2,y2,k2] = draw(p2,bcpb2,bknot2,dknot2(1));
           err = (abs(k1-(y2-y1)/(x2-x1))+abs(k2-(y2-y1)/(x2-x1)))/2;
           plot([x1,x2],[y1,y2],'-o');   
            end            
        end
    end
end

