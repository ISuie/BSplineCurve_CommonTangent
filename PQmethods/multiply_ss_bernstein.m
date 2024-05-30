function[bs] = multiply_ss_bernstein(bs1,bs2)
%bs1是bernstein表达数组[a,m,i]a是前系数
bs = zeros(1,3);
bs(2) = bs1(2)+bs2(2);
bs(3) = bs1(3)+bs2(3);
bs(1) = bs1(1)*bs2(1)*((nchoosek(bs1(2),bs1(3))*nchoosek(bs2(2),bs2(3)))/nchoosek(bs(2),bs(3)));
