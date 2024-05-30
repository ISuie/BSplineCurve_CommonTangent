function [c1,c2,c3,c4] = coefficient_four_interval(f1,f2,c)

[c1] = coefficient_interval(f1);
[c2] = coefficient_interval(f2);
[c3] = coefficient_interval(f1+c*f2);
[c4] = coefficient_interval(f1-c*f2);