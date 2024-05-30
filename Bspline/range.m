function [theta] = range(theta0,theta1,theta2)
%输入三个向量的角度，生成向量的范围
flag = 1;
theta = [];
if theta0<theta2
if theta1<theta0||theta1>theta2
    flag = 0;
end
if flag == 1 
    theta = [theta0,theta2];
elseif flag == 0
    theta = [theta2,360;0,theta0;];
end
elseif theta0>theta2
    if theta1<theta2||theta1>theta0
        flag = 0;
    end
    if flag == 1
        theta = [theta2,theta0];
    elseif flag == 0
        theta = [theta0,360;0,theta2;];
    end
end