function[]= draw_curve(f1,f2,fn,fk,B,f_h,g_h,n1,n2)
%画曲线
figure(fn)
subplot(f1,f2,fk);
hold on;
[f_hh] = h_to_hh(n1,f_h);
[g_hh] = h_to_hh(n2,g_h);
[v1] = fst_curve(f_hh);
[v2] = fst_curve(g_hh);
c1=fimplicit(v1,B);
set(c1,'color','b');
fimplicit(v2,B);
