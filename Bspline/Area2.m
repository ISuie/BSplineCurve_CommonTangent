function[result1,uporlower]= Area2(cpb1,k1,x1,y1,k2,x2,y2,x,y)
%对点有没有落在区间内和在上下的判断
%result=1落在 
%result=0没有落在
%uporlower=1在upper区域
%uporlower=0在lower区域
result1 = 0;
result2 = 0;
uporlower = 1;
if k1~=inf&&k1~=-inf&&k2~=inf&&k2~=-inf
flag1 = k1*x-y+y1-k1*x1;
flag2 = k2*x-y+y2-k2*x2;
b1 = y1-k1*x1;
b2 = y2-k2*x2;
xx = (b2-b1)/(k1-k2);
yy = k1*xx+b1;
elseif k1==inf&&(k2~=inf&&k2~=-inf)
flag1= (x-x1)*(x2-x1);
flag2 = k2*x-y+y2-k2*x2;
b2 = y2-k2*x2;
xx= x1;
yy = k2*xx+b2;
elseif k1 ==-inf&&(k2~=inf&&k2~=-inf)
flag1= (x1-x)*(x2-x1);
flag2 = k2*x-y+y2-k2*x2;
b2 = y2-k2*x2;
xx= x1;
yy = k2*xx+b2;
elseif k2==inf&&(k1~=inf&&k1~=-inf)
flag1 = k1*x-y+y1-k1*x1;
flag2 = (x-x2)*(x2-x1);
b1 = y1-k1*x1;
xx = x2;
yy = k1*xx+b1;
elseif k2==-inf&&(k1~=inf&&k1~=-inf)
flag1 = k1*x-y+y1-k1*x1;
flag2 = (x2-x)*(x2-x1);
b1 = y1-k1*x1;
xx = x2;
yy = k1*xx+b1;
end
polypoint = [xx,yy;cpb1(:,[1,2],1)];
if flag1*flag2 >0
    result1 = 1;
    if flag1>0
        uporlower = 0;
    end
end
if result1==1&&uporlower==0
    [result2]= inorout(polypoint,x,y);
    if result2 == 1
        result1 = 0;
    end
end
    
