function[K,R,Fmx] = Krawczyk(n1,m1,n2,m2,h1,h2,B)
[f1]= changed_bij(h1,n1,m1,B(1),B(2),B(3),B(4));
[f2]= changed_bij(h2,n2,m2,B(1),B(2),B(3),B(4));
%disp('f1');
%disp(f1);
%disp('f2');
%disp(f2);

X =[B(1),B(2);B(3),B(4)];
y =[(B(1)+B(2))/2;(B(3)+B(4))/2;];
disp('X');
disp(X);
%disp('y');
%disp(y);

fy1 =  beziervalue(n1,m1,(y(1)-B(1))/(B(2)-B(1)),(y(2)-B(3))/(B(4)-B(3)),f1);
fy2 =  beziervalue(n2,m2,(y(1)-B(1))/(B(2)-B(1)),(y(2)-B(3))/(B(4)-B(3)),f2);
fy=[fy1;fy2];
%disp('fy');
%disp(fy);

hx1=find_derivative(n1,m1,h1,1);
hy1=find_derivative(n1,m1,h1,2);
hx2=find_derivative(n2,m2,h2,1);
hy2=find_derivative(n2,m2,h2,2);
Fmx = [binomialvalue(length(hx1(1,:))-1,length(hx1(:,1))-1,hx1,y(1,1),y(2,1)),binomialvalue(length(hy1(1,:))-1,length(hy1(:,1))-1,hy1,y(1,1),y(2,1));
       binomialvalue(length(hx2(1,:))-1,length(hx2(:,1))-1,hx2,y(1,1),y(2,1)),binomialvalue(length(hy2(1,:))-1,length(hy2(:,1))-1,hy2,y(1,1),y(2,1));];
Y = inv(Fmx);
%disp('Y条件数');

bx1= changed_bij(hh_to_h(hx1),length(hx1(1,:))-1,length(hx1(:,1))-1,B(1),B(2),B(3),B(4));
by1= changed_bij(hh_to_h(hy1),length(hy1(1,:))-1,length(hy1(:,1))-1,B(1),B(2),B(3),B(4));
bx2= changed_bij(hh_to_h(hx2),length(hx2(1,:))-1,length(hx2(:,1))-1,B(1),B(2),B(3),B(4));
by2= changed_bij(hh_to_h(hy2),length(hy2(1,:))-1,length(hy2(:,1))-1,B(1),B(2),B(3),B(4));

Fx = cell(2);
Fx(1,1) = {[min(bx1,[],'all') ,max(bx1,[],'all')]};
Fx(1,2) = {[min(by1,[],'all') ,max(by1,[],'all')]};
Fx(2,1) = {[min(bx2,[],'all') ,max(bx2,[],'all')]};
Fx(2,2) = {[min(by2,[],'all') ,max(by2,[],'all')]};
%disp('Fx');
%celldisp(Fx);

Fx2 = cell(2);
Fx2(1,1) = {[Y(1,1),Y(1,1)]};
Fx2(1,2) = {[Y(1,2),Y(1,2)]};
Fx2(2,1) = {[Y(2,1),Y(2,1)]};
Fx2(2,2) = {[Y(2,2),Y(2,2)]};
Fx3 = cell(2);
Fx3(1,1) = {[32*B(1)-16,32*B(2)-16]};
Fx3(1,2) = {[-4,-4]};
Fx3(2,1) = {[-4,-4]};
Fx3(2,2) = {[32*B(3)-16,32*B(4)-16]};
R = find_R(Y,Fx);
K = find_K(X,y,Y,fy,Fx);
%disp('R');
%celldisp(R);
disp('K');
celldisp(K);





