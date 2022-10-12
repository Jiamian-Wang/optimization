% input: x_vec, p_vec, func, frad_func, c (slope), r (ratio), alpha_1, derivite
% op: conduct backtrack on my iPad
% output: alpha(k)

% no test conducted 

% while loop to repeat when condition is true

function [alpha]=Backtrack(func, grad_func, x_vec, p_vec, c, r, alpha)

c = 0.1;
r = 0.5;

% fprintf('size(x_vec) is %s\n', mat2str(size(x_vec)));
% fprintf('size(p_vec) is %s\n', mat2str(size(p_vec)));
% fprintf('size(grad_func(x_vec)) is %s\n', mat2str(size(grad_func(x_vec))));
% fprintf('size(func(x_vec)) is %s\n', mat2str(size(func(x_vec))));

while func(x_vec + alpha * p_vec) > func(x_vec) + alpha * c * p_vec'* grad_func(x_vec)
    
    alpha = alpha * r;

end












end