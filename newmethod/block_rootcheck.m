function[I1,I2] = block_rootcheck(n1,m1,n2,m2,h1,h2,B,e)
%对block内根数量的检索，输出单根的区间，若不是单根，则四分继续检索直至单根
[rs1] = bezier_one_check(B,n1,m1,n2,m2,h1,h2);
I1 = [];
I2 = [];
if rs1 == 1
   rnum = one_block_rootnum(n1,m1,n2,m2,h1,h2,B);
   if(rnum==1)
       I1 = B;
   elseif(rnum>1)
       [rs2] = check_oneBlock_size(B,e);
       if(rs2 == 0)
           I2 = [B,rnum];
       else
           B1 = [B(1),(B(1)+B(2))/2,B(3),(B(3)+B(4))/2];
           B2 = [(B(1)+B(2))/2,B(2),B(3),(B(3)+B(4))/2];
           B3 = [B(1),(B(1)+B(2))/2,(B(3)+B(4))/2,B(4)];
           B4 = [(B(1)+B(2))/2,B(2),(B(3)+B(4))/2,B(4)];
           [I11,I12] = block_rootcheck(n1,m1,n2,m2,h1,h2,B1,e);
           [I21,I22] = block_rootcheck(n1,m1,n2,m2,h1,h2,B2,e);
           [I31,I32] = block_rootcheck(n1,m1,n2,m2,h1,h2,B3,e);
           [I41,I42] = block_rootcheck(n1,m1,n2,m2,h1,h2,B4,e);
           if(isempty(I11)==0)
               I1 = [I1;I11];
           end
           if(isempty(I12)==0)
               I2 = [I2;I12];
           end
           if(isempty(I21)==0)
               I1 = [I1;I21];
           end
           if(isempty(I22)==0)
               I2 = [I2;I22];
           end
           if(isempty(I31)==0)
               I1 = [I1;I31];
           end
           if(isempty(I12)==0)
               I2 = [I2;I32];
           end
           if(isempty(I41)==0)
               I1 = [I1;I41];
           end
           if(isempty(I12)==0)
               I2 = [I2;I42];
           end
       end
   end
end