function [I] =  Intersections_with_interval(n1,m1,n2,m2,h1,h2,B,T0,e,N0)
%区间求交方法的总和，包括bezier，K方法，区间合并方法
[f1]= changed_bij(h1,n1,m1,B(1),B(2),B(3),B(4));
[f2]= changed_bij(h2,n2,m2,B(1),B(2),B(3),B(4));

I = [];
B1 = B;
[rs] = bezier_one_check(B1,n1,m1,n2,m2,h1,h2);
draw_curve(2,3,2,2,B,h1,h2,n1,n2)
draw_mesh(2,3,2,2,B1);
title('区间划分');
if rs == 1
for i = 2 : T0-1
    B3 =[];
    for j = 1 : length(B1(:,1))
    [B2] = bezier_check(B1(j,:),n1,m1,n2,m2,h1,h2);
    if isempty(B2)==0
        B3 = [B3;B2];
    end
    end
    B1 = B3;
    draw_curve(2,3,2,i+1,B,h1,h2,n1,n2)
    draw_mesh(2,3,2,i+1,B1);
    title('区间划分');
end
B_bef = B3;
[B4] = connected_component(B3);
[num_bef] = block_number(B4,B3);
B1 = B4;
draw_curve(2,3,2,6,B,h1,h2,n1,n2)
draw_mesh(2,3,2,6,B1);
title('区间合并');
flag = 0;
f1 = 2;
f2 = 3;
fn = 3;
fk = 0;
while flag==0
    k = length(B1(:,1));
    B3 = [];
    num = [];
    fk = fk+1;
    draw_curve(f1,f2,fn,fk,B,h1,h2,n1,n2);
    B_ill = B1;
    for i  = 1 : k
        [A,I2,B2] = Krawczyk_method(n1,m1,n2,m2,h1,h2,B1(i,:),e);
        if A == 1
            I = [I;I2];
            draw_point(f1,f2,fn,fk,I);
        else
        if isempty(B3)==1
            B3 = [B3;B2];
            num = [num;i];
            
        else
            if length(B3(:,1))<=N0
                B3 = [B3;B2];
                num = [num;i];
            end
        end
        end
    end
    if isempty(B3)==0
    draw_mesh(f1,f2,fn,fk,B3,h1,h2,n1,n2);
    end
    title('K方法');
    B1 = [];
    [fn,fk] = renew_figure_number(f1,f2,fn,fk);
    if isempty(num)==1
        break;
    else
        for i = 1 : length(num)
            for j = 1 : length(B_bef(:,1))
                if num_bef(j)==num(i)
                    B1 = [B1;B_bef(j,:)];
                end
            end
        end
        
        fk = fk +1;
        draw_curve(f1,f2,fn,fk,B,h1,h2,n1,n2);
        draw_mesh(f1,f2,fn,fk,B1,h1,h2,n1,n2);
        [fn,fk] = renew_figure_number(f1,f2,fn,fk);
        title('K方法后回到上一个区间');
        
        if isempty(B1) ==0
        B3 = [];
        for j = 1 : length(B1(:,1))
        [B2] = bezier_check(B1(j,:),n1,m1,n2,m2,h1,h2);
        if isempty(B2)==0
        B3 = [B3;B2];
        end
        end
        
        fk = fk+1;
        draw_curve(f1,f2,fn,fk,B,h1,h2,n1,n2);
        draw_mesh(f1,f2,fn,fk,B3,h1,h2,n1,n2);
        [fn,fk] = renew_figure_number(f1,f2,fn,fk);
        title('区间划分');
        
        B_bef = B3;
        [B4] = connected_component(B3);
        [num_bef] = block_number(B4,B3);
        B1 = B4;
        
        fk = fk+1;
        draw_curve(f1,f2,fn,fk,B,h1,h2,n1,n2);
        draw_mesh(f1,f2,fn,fk,B1,h1,h2,n1,n2);
        [fn,fk] = renew_figure_number(f1,f2,fn,fk);
        title('区间合并');
        
        end
    end
    [flag,I,B1] = check_Block(h1,h2,n1,n2,m1,m2,B1,B3,num_bef,e,N0);
end
end

