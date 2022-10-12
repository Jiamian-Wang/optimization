% input: x_vec, p_vec, func, grad_func, #iter, delta1 or delata2
% output: x_vec, func

function [x_vec, func] = Opt_linesearch(x_vec, p_vec, func, grad_func, iter_num)

c = 0.1;
r = 0.5;
alpha = 1.;

for iter=1:iter_num
    
    % determine a search direction: p

    % find a stepsize
    [alpha] = Backtrack(@func, @grad_func, x_vec, p_vec, c, r, alpha);

    x_vec = x_vec + alpha * p_vec;
    

end 



end