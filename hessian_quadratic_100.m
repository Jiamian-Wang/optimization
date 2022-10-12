function [y] = hessian_quadratic_100(x)

y = zeros(length(x), length(x));

for i=1:length(x)
    
    y(i,i) = 2 * i;

end

end