% this script conducts the optimization of quadratic(dim-100), log, and
% bi-quadratic functions. The gradient descent, Newton, and Q-Newton
% methods are applied for all of the functions. 

% To run the code, please:
% 1) specify the pathes of b, c, and A of lof funtion, i.e., in <log_proj2.m>
%    <grad_log.m>, and <hessian_log.m>.
% 2) specify the function that would like to optimize

func_choose = 'quad_100'; % [log] [bi_quad] [quad_100]

if strcmp(func_choose,'quad_100')
    %% test quadratic 100 function
    c = 0.1;
    r = 0.5;
    alpha = 1.;
    x = ones(100, 1);
    [x_vec_1, x_record_1, func_record_1] = GD_Opt_linesearch(x, @quadratic_100, @grad_quadratic_100, 1000, c, r, alpha);
    result_1 = quadratic_100(x_vec_1);
    [x_vec_2, x_record_2, func_record_2] = Newton_Opt_linesearch(@hessian_quadratic_100, x, @quadratic_100, @grad_quadratic_100, 200, c, r, alpha);
    result_2 = quadratic_100(x_vec_2);
    [x_vec_3, x_record_3, func_record_3] = Q_Newton_Opt_linesearch(x, @quadratic_100, @grad_quadratic_100, 500, c, r, alpha);
    result_3 = quadratic_100(x_vec_3);
    
    figure;
    plot([1:200], func_record_1(1:200), 'LineWidth', 2, 'DisplayName','Gradient Descent');
    legend('FontSize', 16);
    hold on;
    plot([1:2], func_record_2(1:2), 'LineWidth', 8, 'DisplayName','Newton w/ line search');
    legend('FontSize', 16);
    hold on;
    plot([1:200], func_record_3(1:200), 'LineWidth', 2, 'DisplayName','Q-Newton w/ line search');
    legend('FontSize', 16);
    hold on;
    title('Quadratic (dim=100)', 'FontSize', 16);
    xlabel('#iteration (k)', 'FontSize', 16);
    ylabel('f(x_k)', 'FontSize', 16);




elseif strcmp(func_choose,'bi_quad')
    c = 0.1;
    r = 0.5;
    alpha = 1.;
    x = zeros(2, 1);
    [x_vec_1, x_record_1, func_record_1] = GD_Opt_linesearch(x, @bi_quadratic, @grad_bi_quadratic, 4000, c, r, alpha);
    result_1 = bi_quadratic(x_vec_1);
    [x_vec_2, x_record_2, func_record_2] = Newton_Opt_linesearch(@hessian_bi_quadratic, x, @bi_quadratic, @grad_bi_quadratic, 1500, c, r, alpha);
    result_2 = bi_quadratic(x_vec_2);
    [x_vec_3, x_record_3, func_record_3] = Q_Newton_Opt_linesearch(x, @bi_quadratic, @grad_bi_quadratic, 1200, c, r, alpha);
    result_3 = bi_quadratic(x_vec_3);
    
    figure;
    plot([1:4000], func_record_1(1:4000), 'LineWidth', 2, 'DisplayName','Gradient Descent');
    legend('FontSize', 16);
    hold on;
    plot([1:1000], func_record_2(1:1000), 'LineWidth', 2, 'DisplayName','Newton w/ line search');
    legend('FontSize', 16);
    hold on;
    plot([1:1200], func_record_3(1:1200), 'LineWidth', 2, 'DisplayName','Q-Newton w/ line search');
    legend('FontSize', 16);
    hold on;
    title('Bi-Quadratic', 'FontSize', 16);
    xlabel('#iteration (k)', 'FontSize', 16);
    ylabel('f(x_k)', 'FontSize', 16);


elseif strcmp(func_choose,'log')


    rng(99);
    x = 0.1 * rand(100,1);
    
    c = 0.1;
    r = 0.5;
    alpha = 0.1;
    [x_vec_1, x_record_1, func_record_1] = GD_Opt_linesearch(x, @log_proj2, @grad_log, 90, c, r, alpha);
    result_1 = log_proj2(x_vec_1);
    
    c = 0.6;
    r = 0.4;
    alpha = 0.2;
    [x_vec_2, x_record_2, func_record_2] = Newton_Opt_linesearch(@hessian_log, x, @log_proj2, @grad_log, 85, c, r, alpha);
    result_2 = log_proj2(x_vec_2);
    
    c_Q = 0.1;
    r_Q = 0.5;
    alpha_Q = 0.01;
    [x_vec_3, x_record_3, func_record_3] = Q_Newton_Opt_linesearch(x, @log_proj2, @grad_log, 50, c_Q, r_Q, alpha_Q);
    result_3 = log_proj2(x_vec_3);
    
    figure;
    plot([1:90], func_record_1(1:90), 'LineWidth', 2, 'DisplayName','Gradient Descent');
    legend('FontSize', 16);
    hold on;
    plot([1:85], func_record_2(1:85), 'LineWidth', 2, 'DisplayName','Newton w/ line search');
    legend('FontSize', 16);
    hold on;
    plot([1:50], func_record_3(1:50), 'LineWidth', 2, 'DisplayName','Q-Newton w/ line search');
    legend('FontSize', 16);
    hold on;
    title('log', 'FontSize', 16);
    xlabel('#iteration (k)', 'FontSize', 16);
    ylabel('f(x_k)', 'FontSize', 16);


end




