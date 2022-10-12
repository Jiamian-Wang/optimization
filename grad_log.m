
function [y] = grad_log(x)

b_vec = importdata("/Users/jmw/Documents/MATLAB/820/project2/data/fun2_b.txt");
b_vec = b_vec';
c_vec = importdata("/Users/jmw/Documents/MATLAB/820/project2/data/fun2_c.txt");
c_vec = c_vec';
fid = fopen('/Users/jmw/Documents/MATLAB/820/project2/data/fun2_A.txt','r');
A = fscanf(fid,'%e ',[500,100]);
fclose(fid);


y = zeros(length(x), 1);
y = c_vec + A' * (1 ./ (b_vec - A * x));



end