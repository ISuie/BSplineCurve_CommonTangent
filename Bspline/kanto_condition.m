function[alpha,beta] = kanto_condition(cA, p0, s0, s1, cB, p1, t0, t1, vari)

samplen = 100;
ss = linspace(s0,s1,samplen);
tt = linspace(t0,t1,samplen);
alpha = 0;
beta = 0;
for i = 1:samplen
    [norjfif] = kantoone(cA, p0, s0, s1, ss, cB, p1, t0, t1, tt, vari)
    if norjfif > alpha
        alpha = norjfif;
    end
end