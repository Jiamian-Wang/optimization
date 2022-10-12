%% test the Newton_Opt with line search
% use quadratic function

%% test quadratic function
% c = 0.1;
% r = 0.5;
% alpha = 1.;
% [x_vec, x_record] = Newton_Opt_linesearch(@hessian_quadrtic, [50;50], @Quadratic, @grad_quadratic, 100, c, r, alpha);
% [x_vec] = Q_Newton_Opt_linesearch([50;50], @Quadratic, @grad_quadratic, 300, c, r, alpha)

%% test quadratic 100 function
% c = 0.1;
% r = 0.5;
% alpha = 1.;
% x = ones(100, 1);
% [x_vec_1, x_record_1, func_record_1] = GD_Opt_linesearch(x, @quadratic_100, @grad_quadratic_100, 1000, c, r, alpha);
% result_1 = quadratic_100(x_vec_1);
% [x_vec_2, x_record_2, func_record_2] = Newton_Opt_linesearch(@hessian_quadratic_100, x, @quadratic_100, @grad_quadratic_100, 200, c, r, alpha);
% result_2 = quadratic_100(x_vec_2);
% [x_vec_3, x_record_3, func_record_3] = Q_Newton_Opt_linesearch(x, @quadratic_100, @grad_quadratic_100, 400, c, r, alpha);
% result_3 = quadratic_100(x_vec_3);


%% test bi-quadratic  function
% c = 0.1;
% r = 0.5;
% alpha = 1.;
% x = zeros(2, 1);
% [x_vec_1, x_record_1, func_record_1] = GD_Opt_linesearch(x, @bi_quadratic, @grad_bi_quadratic, 5000, c, r, alpha);
% result_1 = bi_quadratic(x_vec_1);
% [x_vec_2, x_record_2, func_record_2] = Newton_Opt_linesearch(@hessian_bi_quadratic, x, @bi_quadratic, @grad_bi_quadratic, 1000, c, r, alpha);
% result_2 = bi_quadratic(x_vec_2);
% [x_vec_3, x_record_3, func_record_3] = Q_Newton_Opt_linesearch(x, @bi_quadratic, @grad_bi_quadratic, 1200, c, r, alpha);
% result_3 = bi_quadratic(x_vec_3);


%% test log  function

% data analysis of A and b
fid = fopen('/Users/jmw/Documents/MATLAB/820/project2/data/fun2_A.txt','r');
A = fscanf(fid,'%e ',[500,100]);
fclose(fid);
Amin = min(A,[],'all');
Amax = max(A,[],'all');
b_vec = importdata("/Users/jmw/Documents/MATLAB/820/project2/data/fun2_b.txt");
bmin = min(b_vec,[],'all');
bmax = max(b_vec,[],'all');


rng(99);
x = 0.1 * rand(100,1);

c = 0.1;
r = 0.5;
alpha = 0.1;
[x_vec_1, x_record_1, func_record_1] = GD_Opt_linesearch(x, @log_proj2, @grad_log, 2000, c, r, alpha);
result_1 = log_proj2(x_vec_1);
[x_vec_2, x_record_2, func_record_2] = Newton_Opt_linesearch(@hessian_log, x, @log_proj2, @grad_log, 110, c, r, alpha);
result_2 = log_proj2(x_vec_2);

c_Q = 0.1;
r_Q = 0.5;
alpha_Q = 0.01;
[x_vec_3, x_record_3, func_record_3] = Q_Newton_Opt_linesearch(x, @log_proj2, @grad_log, 2000, c_Q, r_Q, alpha_Q);
result_3 = log_proj2(x_vec_3);




