function[]= draw_mesh(f1,f2,fn,fk,B,f_h,g_h,n1,n2)
%画网格
figure(fn)
subplot(f1,f2,fk);
hold on;
for i = 1 : length(B(:,1))
    x = [B(i,1),B(i,2),B(i,2),B(i,1)];
    y = [B(i,3),B(i,3),B(i,4),B(i,4)];
    patch('XData',x,'YData',y,'facecolor','red','facealpha',0.5);
end
