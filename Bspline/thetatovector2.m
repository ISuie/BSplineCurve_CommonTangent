function [vector,vtpart] = thetatovector2(theta1,theta2,vt1,vt2)
vector = [];
vtpart = [];
vtflag1 =[];
vtflag2 =[];

if length(theta1(:,1))==1
    vtflag1 = [1,1];
else
    vtflag1 = zeros(2,2);
    for i1 =  1 : length(theta1(:,1))
        if theta1(i1,1)~=0
            vtflag1(i1,1) = 1;
        elseif theta1(i1,2)~=180
            vtflag1(i1,2) = 1;
        end
    end
end
if length(theta2(:,1))==1
    vtflag2 = [1,1];
else
    vtflag2 = zeros(2,2);
    for i2 =  1 : length(theta2(:,1))
        if theta2(i2,1)~=0
            vtflag2(i2,1) = 1;
        elseif theta2(i2,2)~=180
            vtflag2(i2,2) = 1;
        end
    end
end
vtpart = zeros(2,2);
for i1 = 1 : length(theta1(:,1))
    for i2 = 1 : length(theta2(:,1))
        if max(theta1(i1,1),theta2(i2,1))<=min(theta1(i1,2),theta2(i2,2))
            if max(theta1(i1,1),theta2(i2,1))==theta1(i1,1)&&vtflag1(i1,1)==1
               vector = [vector;vt1(1,:)];
               vtpart(1,i1) = 1; 
            elseif max(theta1(i1,1),theta2(i2,1))==theta2(i2,1)&&vtflag2(i2,1)==1
               vector = [vector;vt2(1,:)];
               vtpart(1,i2) = 1; 
            end
            if min(theta1(i1,2),theta2(i2,2))==theta1(i1,2)&&vtflag1(i1,2)==1
               vector = [vector;vt1(2,:)];
               vtpart(2,i1) = 1; 
            elseif min(theta1(i1,2),theta2(i2,2))==theta2(i2,2)&&vtflag2(i2,2)==1
               vector = [vector;vt2(2,:)];
               vtpart(2,i2) = 1; 
            end        
        end
    end
end