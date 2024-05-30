function [r,I] = sturm_oneblock(B,f,g,e)
%对一个block病态的判断和sturm算法计算解
I = [];
I1 = [];
I2 = [];
X = [B(1),B(2)];
Y = [B(3),B(4)];
B1 = [];
B2 = [];
[r] = check_res(f,g,X,Y);
if r == 1
[rs] = check_oneBlock_size(B,e);
if rs ==1
    if (X(2)-X(1))>=(Y(2)-Y(1))
        M = (X(1)+X(2))/2;
        B1=[X(1),M,Y(1),Y(2)];
        B2=[M,X(2),Y(1),Y(2)];
        [r1,I1] = sturm_oneblock(B1,f,g,e);
        [r2,I2] = sturm_oneblock(B2,f,g,e);
        I = [I;I1;I2];
    else
        M = (Y(1)+Y(2))/2;
        B1=[X(1),X(2),Y(1),M];
        B2=[X(1),X(2),M,Y(2)];
        [r1,I1] = sturm_oneblock(B1,f,g,e);
        [r2,I2] = sturm_oneblock(B2,f,g,e);
        I = [I;I1;I2];
    end
else
    I = B;
end
end