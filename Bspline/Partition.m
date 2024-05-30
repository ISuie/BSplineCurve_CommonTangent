function [sknot1,sknot2]= Partition(knot1,knot2,p1,p2,cpbsA1,cpbsA2)
%对两段曲线的相同曲线段进行查找
%出来的参数点是对这段曲线而言的参数点，还需要再在外面进行处理才是整段曲线段的参数点
samplen = 1000; 
sknot1 = [ ];
sknot2 = [ ];
spoint = [ ];
dp1 = [ ];
dp2 = [ ];
flag1 = 0;
flag2 = 0;
for i1 = 1 : length(knot1)-1
    cpb1 = cpbsA1(:,:,i1);
     tt1 = linspace(knot1(i1),knot1(i1+1),samplen);
     [ps1, dps1, ddps1] = evalBern_rational_modify(cpb1, p1, knot1(i1),knot1(i1+1), tt1);
     dp = dps1(:,2)./dps1(:,1);
     dp1 =[dp1,dp'];
end
    for i2 =  1 : length(knot2)-1
        cpb2 = cpbsA2(:,:,i2);
        tt2 = linspace(knot2(i2),knot2(i2+1),samplen);
        [ps2, dps2, ddps2] = evalBern_rational_modify(cpb2, p2, knot2(i2),knot2(i2+1), tt2);
        dp = dps2(:,2)./dps2(:,1);
        dp2 =[dp2,dp'];
        
    end

dp1 = unique(dp1);
dp2 = unique(dp2);
if dp1(1)<dp2(length(dp2))&&dp2(1)<dp1(length(dp2))
       spoint = [spoint,max(dp1(1),dp2(1))];
       spoint = [spoint,min(dp1(length(dp1)),dp2(length(dp2)))];
       flag1 = 0;
       flag2 = 0;
       for j1 = 1 : length(dp1)
           
           if abs(dp1(j1)-spoint(1))<1e-2&&flag1 == 0
                flag1 = 1;
                sknot1 = [sknot1,(j1-1)/(length(dp1)-1)];
                
           elseif abs(dp1(j1)-spoint(2))<1e-2&&flag2 == 0
                flag2 = 1;
                sknot1 = [sknot1,(j1-1)/(length(dp1)-1)];
           end
       end
       flag1 = 0;
       flag2 = 0;
       for j2 = 1 : length(dp2)
           
           if abs(dp2(j2)-spoint(1))<1e-2&&flag1 == 0
                flag1 = 1;
                sknot2 = [sknot2,(j2-1)/(length(dp2)-1)];
                
           elseif abs(dp2(j2)-spoint(2))<1e-2&&flag2 == 0
                flag2 = 1;
                sknot2 = [sknot2,(j2-1)/(length(dp2)-1)];
           end
       end
end

        
        