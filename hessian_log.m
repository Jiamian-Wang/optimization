
function [y] = hessian_log(x)

b_vec = importdata("/Users/jmw/Documents/MATLAB/820/project2/data/fun2_b.txt");
b_vec = b_vec';

fid = fopen('/Users/jmw/Documents/MATLAB/820/project2/data/fun2_A.txt','r');
A = fscanf(fid,'%e ',[500,100]);
fclose(fid);

y = ones(length(x), length(x));

y = A' * diag(1 ./ (b_vec - A *x).^2) * A;


end