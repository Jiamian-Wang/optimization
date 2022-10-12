function [y] = hessian_quadrtic(x)

y = zeros(length(x), length(x));
y(1,1) = 2;
y(1,2) = 0;
y(2,1) = 0;
y(2,2) = 20;

end