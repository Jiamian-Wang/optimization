
function [y] = hessian_bi_quadratic(x)

y = zeros(2,2);
y(1,1) = -400 * x(2) + 1200 * x(1)^2 + 2;
y(1,2) = -400 * x(2);
y(2,1) = -400 * x(1);
y(2,2) = 200;

end