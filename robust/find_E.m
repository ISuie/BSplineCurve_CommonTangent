function[E] = find_E(f,g,a,b,c,d)
%查找二元隐函数相交的根的个数，fg是hh形式的
r1 = Ruab(f,g,a,c);
r2 = Ruab(f,g,a,d);
r3 = Ruab(f,g,b,c);
r4 = Ruab(f,g,b,d);
[N1,n1,Na1] = find_sturmN(r1);
[N2,n2,Na2] = find_sturmN(r2);
[N3,n3,Na3] = find_sturmN(r3);
[N4,n4,Na4] = find_sturmN(r4);

Nn1 = [n1;Na1];
Nn2 = [n2;Na2];
Nn3 = [n3;Na3];
Nn4 = [n4;Na4];
E = (0.5)*(N1-N2-N3+N4);
