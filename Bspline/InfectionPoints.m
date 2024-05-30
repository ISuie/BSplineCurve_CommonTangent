function [pointX,pointY,dpointX,dpointY,pknot] = InfectionPoints (cpb,p,s0,s1)
%pointX 拐点的x值
%pointY 拐点的y值
%pknot 拐点参数值
pointX=[ ];
pointY=[ ];
dpointX=[ ];
dpointY=[ ];

pknot=[ ];

samplen=1e5;
tt = linspace(s0,s1,samplen);
[ps, dps, ddps] = evalBern_rational_modify(cpb, p, s0, s1, tt);
k=length(dps);
b=0;
[dps1]=Unitization(dps);
[ddps1]=Unitization(ddps);
flag=0;
lable = 0 ;

for i=1:k
   if (abs(dps1(i,1)*ddps1(i,2)+ddps1(i,1)*dps1(i,2))<=1e-7)
       if(flag==0)
           lable=lable+1;
           flag=1;
       end
       if i+1<=k
       if(flag==1&&abs(dps1(i+1,1)*ddps1(i+1,2)+ddps1(i+1,1)*dps1(i+1,2))<=1e-7)
           lable=lable+1;
       end
       if(flag==1&&abs(dps1(i+1,1)*ddps1(i+1,2)+ddps1(i+1,1)*dps1(i+1,2))>=1e-7&&i+1<=k)
           knot=(i-fix(lable/2))/samplen;
           pknot=[pknot,knot];
            pointX=[pointX,ps(i-fix(lable/2),1)];
            pointY=[pointY,ps(i-fix(lable/2),2)];
            dpointX=[dpointX,dps(i-fix(lable/2),1)];
            dpointY=[dpointY,dps(i-fix(lable/2),2)];
            flag=0;
            lable=0;
       end
       else
           if flag == 1
           knot=(i-fix(lable/2))/samplen;
           pknot=[pknot,knot];
            pointX=[pointX,ps(i-fix(lable/2),1)];
            pointY=[pointY,ps(i-fix(lable/2),2)];
            dpointX=[dpointX,dps(i-fix(lable/2),1)];
            dpointY=[dpointY,dps(i-fix(lable/2),2)];
            flag=0;
            lable=0; 
           end
       end
   end
        
            
end
        
        
