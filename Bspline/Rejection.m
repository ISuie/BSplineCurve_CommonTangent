function [result,k]=Rejection(kx1,pointX1,pointY1,pointX2,cpbsA2,uknot2,Pknot2,curvedr)
%拒绝准则的判断
%result=1没被拒绝
%result=0被拒绝
j1=length(pointX1)-1;
j2=length(pointX2)-1;
result = ones(j1,j2);
k=ones(j2,2);
flag=1;%flag=1代表点在区域内
left=1;
right=1;
k(1,1)=1;
k(j2,2)=length(uknot2)-1;
for i1=1:length(Pknot2)%按照拐点分控制多边形的控制点
    for i2=1:length(uknot2)
       if(uknot2(i2)==Pknot2(i1))
           right=i2-1;
           if right == 0
               right = 1;
           end
           left=i2;
           k(i1,2)=right;
           k(i1+1,1)=left;
       end
    end
end
for i1 = 1 :j1
    for i2=1:j2
        for k1=k(i2,1):k(i2,2)
            for k2 = 1:length(cpbsA2(:,1,k1))
                   x=cpbsA2(k2,1,k1)/cpbsA2(k2,3,k1);
                   y=cpbsA2(k2,2,k1)/cpbsA2(k2,3,k1);
                   [rs,uporlower]= Area(kx1(i1),pointX1(i1),pointY1(i1),kx1(i1+1),pointX1(i1+1),pointY1(i1+1),x,y);
                   if curvedr(i1,i2)==1&&uporlower==0&&rs==1 %rejection准则2
                       result(i1,i2)=0;
                      break
                   end
                   if rs==0%rejection准则1
                       flag=0;
                       break
                   end
             end
                 if result(i1,i2)==0
                    break
                 end
        end
              if flag==1
                  result(i1,i2)=0;
              end
       flag=1;
    end
end
                       
                 
               
        
        
    
