function [theta1] = combine (theta2)
%将角度里面的0和180合并起来,把相等的合起来
theta1 = [];
if theta2(1,1)== theta2(1,2)
    theta2 = theta2(2,:);
    theta1 = theta2;
end
if theta2(2,1)==theta2(2,2)
    theta2 = theta2(1,:);
    theta1 = theta2;    
end

if length(theta2(:,1))==2
for i1 = 1 : length(theta2(:,1))
    for i2 = 1 : length(theta2(1,:))
        if theta2(i1,i2) ~= 0&& theta2(i1,i2) ~= 180
            theta1 = [theta1,theta2(i1,i2)];
        end
    end
end
end