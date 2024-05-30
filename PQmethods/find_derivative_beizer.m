function[Q2,n2] = find_derivative_beizer(Q1,n1,t0,t1)
%对beizer曲线进行求导，导出求导后的控制顶点矩阵
%Q1原控制点矩阵，n1原次数，t0,t1参数范围
k = length(Q1(:,1));
Q2 = [];
if abs(t1-t0)>1e-5
for i = 1 : k-1
    Q2 =[Q2;n1*(Q1(i+1,:)-Q1(i,:))*(1/t1-t0)];
end
n2 = n1 -1;
end

