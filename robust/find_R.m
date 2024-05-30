function [R] = find_R(Y,Fx)
%求R
[r] = interval_matrix_multiplication(Y,Fx);
R = cell(2);
R(1,1)={interval_add([1,1],r{1,1},2)};
R(1,2)={interval_add([0,0],r{1,2},2)};
R(2,1)={interval_add([0,0],r{2,1},2)};
R(2,2)={interval_add([1,1],r{2,2},2)};