 

function result = BspCurv( C,U,t,k)
%
%C控制点,U节点序列,U(k)<=t<U(k+1)
%
%
dev1=0;
dev2=0;
%%计算一阶导数
for i=k-2:k
    dev1=dev1+DeBoorDv(C,U,t,i,1)*Bbase(i,2,U,t);
end
%计算二阶导数
for i=k-1:k
    dev2=dev2+DeBoorDv(C,U,t,i,2)*Bbase(i,1,U,t);
end