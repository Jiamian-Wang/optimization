% Q-Newton

% input: x_vec, func, grad_func, iter_num, F_mat
% output: x_vec, func


function [x_vec, x_record, func_record] = Q_Newton_Opt_linesearch(x_vec, func, grad_func, iter_num, c, r, alpha)


x_record = zeros(length(x_vec), iter_num);
func_record = zeros(iter_num,1);


F_mat = eye(length(x_vec));


x_vec_ori = zeros(length(x_vec)); 
s_vec = zeros(length(x_vec));
y_vec = zeros(length(x_vec));

for iter=1:iter_num

    fprintf('iter=%d\n', iter);
    fprintf('x_vec=[%f,%f]', x_vec(1), x_vec(2));
    fprintf('func val=%f', func(x_vec));

    

    x_vec_ori = x_vec;
    
    % determine a search direction: p
    p_vec = - F_mat * grad_func(x_vec);
    

    % find a stepsize
    [alpha] = Backtrack(func, grad_func, x_vec, p_vec, c, r, alpha); % f g p x 

    x_vec = x_vec + alpha * p_vec;
    x_record(:, iter) = x_vec;
    func_record(iter) = func(x_vec);
    
    % update F_mat
    s_vec = x_vec - x_vec_ori;
    y_vec = grad_func(x_vec) - grad_func(x_vec_ori);

    term1 = y_vec'*(F_mat * y_vec + s_vec)* s_vec * s_vec'/(y_vec' * s_vec)^2;
    term2 = (s_vec * y_vec' * F_mat + F_mat * y_vec * s_vec')/(y_vec' * s_vec);

    F_mat = F_mat + term1 - term2;
    

end 



end