function [K] = find_K(X,y,Y,fy,Fx)
[R] = find_R(Y,Fx);
Xy = cell(2,1);
Xy(1,1) = {interval_add(X(1,:),[y(1),y(1)],2)};
Xy(2,1) = {interval_add(X(2,:),[y(2),y(2)],2)};

k2 = interval_matrix_multiplication2(R,Xy);
k1 = y - Y*fy;
K = cell(2,1);
K(1,1) = {interval_add(k2{1,1},[k1(1),k1(1)],1)};
K(2,1) = {interval_add(k2{2,1},[k1(2),k1(2)],1)};