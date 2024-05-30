function[fn1,fk1] = renew_figure_number(f1,f2,fn,fk)
fn1 = fn;
fk1 = fk;
if fk == f1 * f2
    fk1 = 0;
    fn1 = fn+1;
end
