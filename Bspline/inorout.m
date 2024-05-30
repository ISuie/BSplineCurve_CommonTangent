function[result]= inorout(polypoint,x,y)
%result=1 在内部
%result=0 在外部
%判断点是否在两条线和曲线构成的小型弧形区
result = 0;
polyside = length(polypoint(:,1));
j = polyside;
for i = 1:polyside
    if ((polypoint(i,2)< y && polypoint(j,2)>=y)||(polypoint(i,2)>=y&&polypoint(j,2)<y))&&(polypoint(i,1)<=x||polypoint(j,1)<=x)
        if (polypoint(i,1)+(y-polypoint(i,2))/(polypoint(j,2)-polypoint(i,2))*(polypoint(j,1)-polypoint(i,1))<x)
            if result == 1
                result = 0;
            else
                result = 1;
            end
        end
    end
end

