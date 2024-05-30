function [vector,vtpart] = thetatovector(theta1,theta2,vt1,vt2)
vector = [];
vtpart = [];
lefttheta = [];
righttheta = [];
for i1 = 1 : length(theta1(:,1))
    for i2 = 1 : length(theta2(:,1))
        if max(theta1(i1,1),theta2(i2,1))<min(theta1(i1,2),theta2(i2,2))
            lefttheta = [lefttheta,max(theta1(i1,1),theta2(i2,1))];
            righttheta =[righttheta,min(theta1(i1,2),theta2(i2,2))];
        end
    end
end
if isempty(lefttheta)==0&&isempty(righttheta)==0
theta = [lefttheta',righttheta'];
if length(lefttheta) > 1
     [theta] = combine (theta);
end
if length(theta1(:,1)) >1
    [theta1] = combine (theta1);
end
if length(theta2(:,1)) >1
    [theta2] = combine (theta2);
end
vtpart = zeros(2,2);
for i1 = 1 : length(theta)
    if theta(i1) ==  theta1(i1)
        vector = [vector;vt1(i1,:)];
        vtpart(1,i1) = 1; 
    end
    if theta(i1) == theta2(i1)&&vtpart(1,i1)==0
        vector = [vector;vt2(i1,:)];
        vtpart(2,i1) = 1; 
    end
end
end