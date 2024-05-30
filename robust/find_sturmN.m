function [N,n1,Na] = find_sturmN(R)
syms u
dR = diff(R);
r = sym2poly(R);
dr = sym2poly(dR);
n(1,1) = {r};
n(1,2) = {dr};
q = r;
[rs] = check_remainder(q);
i = 1;
while rs==0
    f = n{1,i};
    g = n{1,i+1};
    [Q,q]=deconv(f,g);
    [rs] = check_remainder(q);
    if rs == 0
        i = i +1;
        q_num = min(find(q~=0));
        q = (-1)*q(q_num:end);
        n(1,i+1) = {q};
    else
        q_num = min(find(q~=0));
        q = (-1)*q(q_num:end);
        n(1,i+2) = {q};
    end
end

n1 = [];
for i = 1 : length(n)
    f = n{1,i};
    k = polyval(f,0);
    n1 = [n1,k];
end
[N,Na] = count_sturm(n1);

