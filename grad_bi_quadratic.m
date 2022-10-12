function [y] = grad_bi_quadratic(x)

y = zeros(2,1);

y(1) = 400 * x(1)^3 - 400 * x(1)*x(2) + 2 * x(1) -2;
y(2) = 200 * x(2) - 200 * x(1)^2;

end