function[m] = Sylvester(f,g)
k1 = length(f);
k2 = length(g);
k = max(k1,k2);
[f1] = extend_matrix(f,k);
[g1] = extend_matrix(g,k);
m = [f1 g1];