clc;
clear;
% GA TS SA
method='SA ';
fun=str2func(method);
result=fun();
% GA算法 最大代数足够大的话，很大概率能够找到最优解 5
% TS算法 较难找到最优解
% SA 比较玄学，有时最终结果甚至比初始值还低。

