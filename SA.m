function res = SA()
% SA 
x=rand(1,2)*20-10;
T0=1000;
Tf=0;
k=0;
Tk=T0;
dT=10;
nT=10000;% inner loop
while Tk>Tf
    n=0;
    while n<nT
        x_new=move(x);
        n=n+1;
        delta=schaffer(x_new)-schaffer(x);
        if delta>0
            x=x_new;
        else
            eps=rand();
            if exp(delta/Tk)>eps
                x=x_new;
            end
        end
    end
    k=k+1;
    Tk=Tk-dT;
end

res=schaffer(x);
disp(res);
end

