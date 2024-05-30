function[num] = one_block_rootnum(n1,m1,n2,m2,h1,h2,B)
%计算一个区间内根的数量，通过二元sturm公式
[f] = h_to_hh(n1,h1);
[g] = h_to_hh(n2,h2);

[num] = find_E(f,g,B(1),B(2),B(3),B(4));