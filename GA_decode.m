function pop = GA_decode(bin_pop)
[pop_size, ~]=size(bin_pop);
pop_size=pop_size/2;
pop=zeros(pop_size,2);
tmp=bin2dec(bin_pop);
for i=1:pop_size 
pop(i,1)=tmp(i)/1e+3-100;
pop(i,2)=tmp(i+pop_size)/1e+3 -100;
end
end

