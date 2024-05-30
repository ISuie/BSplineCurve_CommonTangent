function[result,uporlower]= Area(k1,x1,y1,k2,x2,y2,k3,x3,y3,x,y)
%对点有没有落在区间内和在上下的判断
%result=1落在 
%result=0没有落在
%uporlower=1在upper区域
%uporlower=0在lower区域
%k1是前一个端点切线的k值，b1是b值，k2是后一个端点切线的k值，b2是b值
b1=y1-k1*x1;
b2=y2-k3*x3;
x0=(b1-b2)/(k3-k1);%求出两条切线的交点
y0=((b1-b2)/(k3-k1))*k1+b1;
result=0;
uporlower=0;

a1=angle([0,0],[x1-x0,y1-y0]);
a2=angle([0,0],[x2-x0,y2-y0]);
a3=angle([0,0],[x3-x0,y3-y0]);

b1=angle([0,0],[2*x0-x1,2*y0-y1]);
b2=angle([0,0],[2*x0-x2,2*y0-y2]);
b3=angle([0,0],[2*x0-x3,2*y0-y3]);

p=angle([0,0],[x-x0,y-y0]);
[theta1] = range(a1,a2,a3);
[theta2] = range(b1,b2,b3);

for j1 = 1 : length(theta1(:,1))
  if (p>theta1(j1,1)&&p<theta1(j1,2))||p==theta1(j1,1)||p==theta1(j1,2)
      result = 1;
  end
end
for j2 = 1 : length(theta2(:,1))
  if (p>theta2(j2,1)&&p<theta2(j2,2))||p==theta2(j2,1)||p==theta2(j2,2)
      result = 1;
      uporlower=1;
  end
end




