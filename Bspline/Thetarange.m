function [theta,vector] = Thetarange(theta0,theta1,theta2,vt0,vt2)
theta = [];
vector = [];
flag = 1;%如果向量小到大转，flag是1；大到小转，flag是0；
if theta0<theta2
if theta1<theta0||theta1>theta2
    flag = 0;
end
if flag == 1 
    if theta0 == 180
        theta = [0,theta2-180];
    elseif theta2 == 180
        theta = [theta0,theta2];
    elseif theta2 > 180 && theta0 < 180
        theta = [theta0,180;0,theta2-180];
    elseif theta2 > 180 && theta0 > 180
        theta = [theta0-180,theta2-180];
    else
    theta = [theta0,theta2];
    end
    vector = [vt0;vt2];
elseif flag == 0
     if theta0 == 0
         theta = [theta2-180,180];
     else
     theta = [theta2-180,180;0,theta0;];
     end
     vector = [vt2;vt0];
end
elseif theta0>theta2
    if theta1<theta2||theta1>theta0
        flag = 0;
    end
    if flag == 1
       if theta2 == 180
        theta = [0,theta0-180];
       elseif theta0 == 180
        theta = [theta2,theta0];
       elseif theta0 > 180 && theta2 < 180
        theta = [theta2,180;0,theta0-180];
       elseif theta0 > 180&&theta2>180
        theta = [theta2-180,theta0-180];
       else
        theta = [theta2,theta0];
       end
        
        vector = [vt2;vt0];
    elseif flag == 0
     if theta2 == 0
         theta = [theta0-180,180];
     else
     theta = [theta0-180,180;0,theta2;];
     end
     vector = [vt0;vt2];
    end
end