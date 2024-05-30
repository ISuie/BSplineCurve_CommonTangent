function[I] = Krawczyk_circulate(n1,m1,n2,m2,h1,h2,B,e)
k = 0;
B = [B{1}(1),B{1}(2),B{2}(1),B{2}(2)];
while ((B(2)-B(1))>e||(B(4)-B(3))>e)
[B2] = Krawczyk(n1,m1,n2,m2,h1,h2,B);
B = [B2{1}(1),B2{1}(2),B2{2}(1),B2{2}(2)];
k = k +1;
if k == 100
    break;
end
end
disp('循环次数');
disp(k);

I = [(B(2)+B(1))/2,(B(3)+B(4))/2];
disp('结果');
disp(I);
