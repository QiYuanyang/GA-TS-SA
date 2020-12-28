function best_val = TS()
% initial solution
x=rand(1,2)*200-100;
tabu_list=zeros(1000,1); 
tabu_idx=1;
max_iter=10000;
x_star=x;
val_star=schaffer(x_star);
k=0;
while k<=max_iter
    k=k+1;
    s_num=50;
    s_set=ones(s_num,2).*x+(rand(s_num,2)*20-10);
    s_val=zeros(s_num,1);
    for i=1:s_num
        if abs(s_set(i,1))>100||abs(s_set(i,2))>100
            s_set(i,1)=mod(s_set(i,1),100);
            s_set(i,2)=mod(s_set(i,2),100);
        end
        s_val(i)=schaffer(s_set(i,:));
    end
    [max_s_val,max_s_x]=max(s_val);
    x_cur=s_set(max_s_x,:);
    if max_s_val>val_star
        x_star=x_cur;
        val_star=schaffer(x_star);
    else
        tb_sort=sort(tabu_list,'descend');
        [s_val_sort,s_id_sort]=sort(s_val,'descend');
        for i=1:s_num
           if ~ismember(s_val_sort,tabu_list)
               x_cur_id=s_id_sort(i);
               x_cur=s_set(x_cur_id,:);
               break;
           end
        end
    end
    x=x_cur;
    tabu_list(tabu_idx)=schaffer(x_cur);
    tabu_idx=tabu_idx+1;
    if tabu_idx>1000
        tabu_idx=tabu_idx-1000;
    end
end

best_val=schaffer(x);
disp(best_val);
end

