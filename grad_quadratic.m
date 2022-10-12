function [y] = grad_quadratic(x)

y = zeros(length(x), 1);

y(1) = 2 * x(1);
y(2) = 20 * x(2);

end