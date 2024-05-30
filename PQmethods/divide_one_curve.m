function[q1,q2] = divide_one_curve(p,lam)
%对p组控制顶点进行切割，lam是切割系数,p只有一行
k = length(p);
q = [p;zeros(k-1,k)];
q1 = [p(1)];
q2 = [p(k)];
for i = 2 : k
    for j = 1 : k-i+1
        q(i,j) = q(i-1,j)*(1-lam)+q(i-1,j+1)*lam;
        if j ==1
            q1 = [q1,q(i,j)];
        end
        if j ==k-i+1
            q2 = [q(i,j),q2];
        end
    end
end
