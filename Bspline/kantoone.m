function[norjfif] = kantoone(cA, p0, s0, s1, ss, cB, p1, t0, t1, tt, vari)

[fnv, jacob_fnv] = evalf1f2_rational_modified2_vari(cA, p0, s0, s1, ss, cB, p1, t0, t1, tt, vari);

jacob_fnv_inv = inv(jacob_fnv);
if(isempty(jacob_fnv_inv)==0)
    %norjfif means norm( jacob_fnv_inv * fnv )
    norjfif = norm(jacob_fnv_inv\fnv);
end