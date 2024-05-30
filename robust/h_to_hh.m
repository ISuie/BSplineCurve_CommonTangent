function [hh] = h_to_hh(n,h1)
hh = [];
k = length(h1)/(n+1);
for i = 1:k
    hh = [hh;h1((i-1)*(n+1)+1:i*(n+1))];
end