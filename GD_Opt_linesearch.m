% GD method

% input: H, 

function [x_vec, x_record, func_record] = GD_Opt_linesearch(x_vec, func, grad_func, iter_num, c, r, alpha)

x_record = zeros(length(x_vec), iter_num);
func_record = zeros(iter_num,1);

for iter=1:iter_num
    
    fprintf('iter=%d\n', iter);
    fprintf('x_vec=[%f,%f]', x_vec(1), x_vec(2));
    fprintf('func val=%f', func(x_vec));

    
    % steepest descent direction
    p_vec = - grad_func(x_vec);

    % find a stepsize
    [alpha] = Backtrack(func, grad_func, x_vec, p_vec, c, r, alpha);

    x_vec = x_vec + alpha * p_vec;

    x_record(:, iter) = x_vec;
    func_record(iter) = func(x_vec);
    

    
    

end 



end