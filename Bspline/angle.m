function [angle]=angle(A,B)
%向量的夹角(0~360)
angle = 0;
if length(A)==2&&length(B)==2
distance_x=B(1)-A(1);
distance_y=B(2)-A(2);
if distance_x>0 && distance_y>=0
angle=atan(distance_y/distance_x);
elseif distance_x<=0 && distance_y>0
angle=pi/2+atan(abs(distance_x)/distance_y);
elseif distance_x<0 && distance_y<=0
angle=pi+atan(distance_y/distance_x);
elseif distance_x>=0 && distance_y<0
angle=3*pi/2+atan(distance_x/abs(distance_y));
end
end
angle=angle/pi*180;
