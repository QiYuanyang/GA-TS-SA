function bin_pop = GA_encode(pop,code_len)
bin_pop = dec2bin(round((pop+100)*1e+3),code_len);% mapping  original number into integer
% i_th element in original pop is i_th and i+50_th char in bin pop
end

