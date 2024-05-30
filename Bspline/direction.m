function [result]= direction(dpointX1,dpointY1,dpointX2,dpointY2)
%对两条曲线方向的判断
%result=0正方向
%result=1反反向

k1=length(dpointX1)-1;
k2=length(dpointX2)-1;
result=zeros(k1,k2);
h1=0;
h2=0;

for i1 = 1:k1
    h1= (dpointY1(i1+1)/dpointX1(i1+1)-dpointY1(i1)/dpointX1(i1));
    for i2 = 1:k2
        h2=(dpointY2(i2+1)/dpointX2(i2+1))-(dpointY2(i2)/dpointX2(i2));
        if ((h1*h2)<0)
            result(i1,i2)=1;
        end
    end
end
        