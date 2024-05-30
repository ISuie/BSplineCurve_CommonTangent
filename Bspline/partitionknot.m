function [sknot] = partitionknot(cpb,knot,p,vt)
%找出对应向量在曲线的参数点
samplen = 1000;
tt = linspace(knot(1),knot(2),samplen);
[ps, dps, ddps] = evalBern_rational_modify(cpb, p, knot(1),knot(2), tt);
dr = 0;%升序是0，倒序是1
i1 = 1;
i2 = length(dps(:,1));
m = 0;
sknot = [];
k = dps(:,2)./dps(:,1);
if isequal(vt,dps(1,:))==1
    sknot = knot(1);
elseif isequal(vt,dps(length(dps(:,1)),:))==1
    sknot = knot(2);
else
while(dps(i1,1)==0||dps(i2,1)==0)
   i1=i1+1;
   i2=i2-1;
end
if ((dps(i1,2)/dps(i1,1))>(dps(i2,2)/dps(i2,1)))
    dr =1;
end
if vt(1) ~= 0
kvt = vt(2)/vt(1);
left = 1;
right = samplen;
flag = 0;
   while(flag == 0&&left~=right-1)
       m = round((left+right)/2);
     if(dps(m,1)~=0)
         n = dps(m,2)/dps(m,1);
       if(abs(dps(m,2)/dps(m,1)-kvt)<1e-3)
        flag = 1;
       else
        if((dr==0&&(dps(m,2)/dps(m,1))<kvt)||(dr==1&&(dps(m,2)/dps(m,1)>kvt)))
         left = m;
        elseif((dr==0&&(dps(m,2)/dps(m,1))>kvt)||(dr==1&&(dps(m,2)/dps(m,1)<kvt)))
         right = m;
        end
       end
     else
         m = m+1;
     end
   end
else
    for i1 = 1 : length(dps(:,1))
        if abs(dps(i1,1)-0)<1e-2
            m = i1;
            break
        end
    end
end
sknot = ((m-1)/(length(dps(:,1))-1))*(knot(2)-knot(1))+knot(1);
end