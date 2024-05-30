function[f1] = extend_matrix(f,k)
k1 = length(f);
f1 = zeros(k,k-k1+1);
for i = 1 : k-k1+1
    for j  = 1 : k1
        f1(i+j-1,i) = f(j);
    end
end