function[result,I,B] = check_Block(h1,h2,n1,n2,m1,m2,B1,B2,num,e,N0)
%检查是否所有的block缩小到范围内或者block已经为空
%result==0是程序依旧继续，==1停止程序
result =1;
B = B1;
I = [];
unas = [];
as = [];
u_num  = unique(num);
a=hist(num, u_num);
for i = 1 : length(u_num)
    if a(i) >= N0
       [f] = h_to_hh(n1,h1);
       [g] = h_to_hh(n2,h2);
       [B_as,B_unas] = merge_assigned_block(B2,num,a(i));
       [r,I2] = sturm_oneblock(B_as,f,g,e);
       if r == 1&&isempty(I2)==0
           I = [I;I2];
           as = [as,a(i)];
       elseif r == 0
           unas = [unas,a(i)];  
       end
    end
end
if isempty(as)==0 || isempty(unas) ==0
    un_as = [as;unas];
    for i = 1 : length(un_as(:,1))
        [B_as,B_unas] = merge_assigned_block(B2,num,un_as(i));
        B = B_unas;
        [B_merge] = connected_component(B);
        [num] = block_number(B_merge,B);
    end 
    B = B_merge;
end

if isempty(B)==0
for i  = 1 : length(B(:,1))
    if ((B(i,2)-B(i,1))>e||(B(i,4)-B(i,3))>e)
        result = 0;
    end
end
end