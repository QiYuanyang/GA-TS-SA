x0=rand(1,2);
fun=@schaffer;
lb=[-100,-100];
ub=[100,100];
val=simulannealbnd(fun,x0,lb,ub)