function x_new = move(x)
step=rand(1,2)*0.2-0.1;
x_new=mod(x+step,100);
end