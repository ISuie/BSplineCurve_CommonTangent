function[]= draw_point(f1,f2,fn,fk,I)
%绘制点
figure(fn)
subplot(f1,f2,fk);
hold on;
for i  = 1 : length(I(:,1))
scatter(I(i,1),I(i,2));
end