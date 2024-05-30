function [cknot1,cknot2] = choose(p1,p2,knot1,knot2,cpb1,cpb2,sknot1,sknot2)
%在重复的线段中选择最合适的一条
n = 1;
array = [0];
sknot11 = (sknot1(:,2)+sknot1(:,1))/2;
sknot22 = (sknot2(:,2)+sknot2(:,1))/2;
cknot1 = [];
cknot2 =[];
fknot1 =[];
fknot2 =[];
for i1 = 1 : length(sknot11)-1
    if abs(sknot1(i1+1,1)-sknot1(i1,2))>5e-3
        n = n+1;
        array = [array,i1-1];
    end
end
array = [array,length(sknot1(:,1))];
for j1 = 1 : n
    [x1,y1,k1] = draw(p1,cpb1,knot1,sknot11(array(j1)+1));
    [x2,y2,k2] = draw(p2,cpb2,knot2,sknot22(array(j1)+1));
    bestk = abs((y1-y2)/(x1-x2)-k1)+abs((y1-y2)/(x1-x2)-k2);
    c = array(j1)+1;
    for j2 = array(j1)+1:array(j1+1)
       [x1,y1,k1] = draw(p1,cpb1,knot1,sknot11(j2));
       [x2,y2,k2] = draw(p2,cpb2,knot2,sknot22(j2));
       k = abs((y1-y2)/(x1-x2)-k1)+abs((y1-y2)/(x1-x2)-k2);
       if k < bestk
           bestk = k;
           c = j2;
       end
    end
    fknot1 = [fknot1;sknot11(c),1;];
    fknot2 = [fknot2;sknot22(c),1;];
end
for i2 = 1 : length(fknot1(:,1))
    [x1,y1,k1] = draw(p1,cpb1,knot1,fknot1(i2,1));
    [x2,y2,k2] = draw(p2,cpb2,knot2,fknot2(i2,1));
    if (abs((y1-y2)/(x1-x2)-k1)+abs((y1-y2)/(x1-x2)-k2))>5e-1
        fknot1(i2,2) = 0;
        fknot2(i2,2) = 0;
    end
    if x1==x2&&y1==y2
        fknot1(i2,2) = 0;
        fknot2(i2,2) = 0;
    end
end
for i3 = 1 : length(fknot1(:,1))
    if fknot1(i3,2)~=0
        cknot1 =[cknot1,fknot1(i3,1)];
        cknot2 =[cknot2,fknot2(i3,1)];
    end
end