function f = schaffer(x)
%JDSCHAFFER OBJECTIVE FUNCTION
upperBound=[100,100];
lowerBound=[-100,-100];

% check if x within range
flag=1;
for i=1:length(x)
    if x(i)>upperBound(i) || x(i)<lowerBound(i)
        flag=0;
    end
end
if flag==0
    msg='input not in range';
    error(msg);
end

f=4.5-(sin(sqrt(x(1)^2+x(2)^2))^2-0.5)/(1+0.001*(x(1)^2+x(2)^2))^2;


end

