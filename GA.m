function best_value = GA()
% using binary coding, 3 digits after decimal gives coding char length of 19 digits
code_len = 20;
% generate initial population
NP=100; % init population size
NG=100000; % max generation
Pm=0.05; % mutation rate
% initial population 
init_real_pop = roundn(200.*rand(NP,2)-100,-3);
% schaffer function here is non-negtive, take fitness function=schaffer
% itself
pop=init_real_pop;
for gen=1:NG
    pop_bin=GA_encode(pop,code_len);
    fitness=GA_fitness(pop);
    % disp best fitness
    best_val=max(fitness)+4;
    disp(best_val);
    child=zeros(NP,2);
    % select elite children e for elite
    [e_fitness,e_index]=maxk(fitness,2);
    elite=pop(e_index,:);
    child(1:2,:)=elite;
    
    child_bin=GA_encode(child,code_len);
    %  Roulette to determine parents
    P=zeros(NP,1);
    PP=zeros(NP,1);
    sum_fitness=sum(fitness);
    P(1)=fitness(1)/sum_fitness;
    PP(1)=P(1);
    % generate rest of the offsprings
    for i=2:NP
        P(i)=fitness(i)/sum_fitness;
        PP(i)=PP(i-1)+P(i);
    end
    for i=3:2:NP
        % for each 2 child, choose 2 parent
        eps=rand(2,1);
        for j=1:NP
            if eps(1)<=PP(j)
                parent1_index=j;
                break;
            end
        end
        for j=1:NP
            if eps(2)<=PP(j)
                parent2_index=j;
                break;
            end
        end
        parent1_x1=pop_bin(parent1_index,:);
        parent1_x2=pop_bin(parent1_index+NP,:);
        parent2_x1=pop_bin(parent2_index,:);
        parent2_x2=pop_bin(parent2_index+NP,:);

        % cross
        cross_pt1=randi(code_len);
        child_bin(i,:)=[parent1_x1(1:cross_pt1),parent2_x1(cross_pt1+1:code_len)];
        child_bin(i+1,:)=[parent2_x1(1:cross_pt1),parent1_x1(cross_pt1+1:code_len)];
        
        cross_pt2=randi(code_len);
        child_bin(i+NP,:)=[parent1_x2(1:cross_pt1),parent2_x2(cross_pt1+1:code_len)];
        child_bin(i+1+NP,:)=[parent2_x2(1:cross_pt1),parent1_x2(cross_pt1+1:code_len)]; 
        
    end
    % mutation and return child generation
    for i=1:2*NP
        if rand()<=Pm
            mute_pt=randi(code_len);
            if child_bin(i,mute_pt)=='0'
                child_bin(i,mute_pt)='1';
            else
                child_bin(i,mute_pt)='0';
            end
        end
    end
    child=GA_decode(child_bin);
    % loop to check if variable in constrain
    for i=1:NP
        if abs(child(i,1))>100 || abs(child(i,2))>100
            child(i,1)=mod(child(i,1),100);
            child(i,2)=mod(child(i,2),100);
        end 
    end
   pop=child;
end
best_value=best_val;
end


