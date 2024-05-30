function [q] = divide_block(p,x,x0,y,y0)
%对beizer形式的p进行分割,原p为x、y区域部分,留下x为x0区域部分，y为y0区域部分
lamx0 = (x0(1) - x(1))/(x(2)-x(1));
lamx1 = (x0(2) - x(1))/(x(2)-x(1));
lamy0 = (y0(1) - y(1))/(y(2)-y(1));
lamy1 = (y0(2) - y(1))/(y(2)-y(1));
[q1,q2] = divide_two_curve(p,lamx0,1);
[q21,q22] = divide_two_curve(q2,lamx1,1);
[q3,q4] = divide_two_curve(q21,lamy0,2);
[q33,q34] = divide_two_curve(q3,lamy1,2);
q = q33;