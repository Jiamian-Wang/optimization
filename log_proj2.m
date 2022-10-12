%% log
function [y] = log_proj2(x)

b_vec = importdata("/Users/jmw/Documents/MATLAB/820/project2/data/fun2_b.txt");
b_vec = b_vec';
c_vec = importdata("/Users/jmw/Documents/MATLAB/820/project2/data/fun2_c.txt");
c_vec = c_vec';
fid = fopen('/Users/jmw/Documents/MATLAB/820/project2/data/fun2_A.txt','r');
A = fscanf(fid,'%e ',[500,100]);
fclose(fid);

y = c_vec' * x + sum(log(b_vec - A * x));
% fprintf('y is %f\n', y);


end