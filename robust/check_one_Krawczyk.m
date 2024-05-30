function [result1,result2] = check_one_Krawczyk(K,R,B)
%result1表示是否有唯一解，result2表示R是否小于1
%1代表有解，代表小于1,2代表区间有重合，需要再判断
result1 = 2;
result2 = 0;
if (K(1)>=B(2)||K(2)<=B(1))||(K(3)>=B(4)||K(4)<=B(3))
    result1 = 0;
end
if K(1)>=B(1)&&K(2)<=B(2)&&K(3)>=B(3)&&K(4)<=B(4)
    result1 = 1;
    [result2] = check_R(R);
end
    
