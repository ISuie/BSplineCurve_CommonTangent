function[Q2] = find_conjugate(Q1)
%对控制点矩阵求共轭
Q2 = [-1.*Q1(:,2) Q1(:,1)];