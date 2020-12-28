function fitness = GA_fitness(pop)
[NP,~]=size(pop);
fitness=zeros(NP,1);
for i=1:NP
    fitness(i)=schaffer(pop(i,:))-4;
end
end

