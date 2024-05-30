function[R] = Ruab(f,g,a,b)
syms x
syms y
syms u
k1 = length(f(1,:))-1;
k2 = length(g(1,:))-1;
[fc] = fst_curve(f);
[gc] = fst_curve(g);
uc = u+(x-a)*(y-b);
u1 = resultant(fc,uc,x);
u2 = resultant(gc,uc,x);
u3 = resultant(u1,u2,y);
R = u3/u^(k1*k2);
R = simplify(R);
R = expand(R);