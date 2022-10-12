%% approximaion of the gradient

% input 1: function 
% input 2: a particular x vector (at which to compute gradient)
% input 3: h, small value
% input 4: order

% output: a function 

% note: MATLAB can take function as input 
% note: in matlab, e is 

% test (C4 Newton): 
% y = x_1^2 + 10 x_2^2, x=[50,50]
% y = e^(x_1+ 3 x_2 -0.1) + e^(x_1 - 3 x_2  -0.1) + e^(-x_1 - 0.1), x=[2., 1.]


%% questions 
% how to take function as input?
% just "f", in the code: f0 = f(x), you can define f() in a func.m file
% when calling: Approx_gradient(@func_in, [2,1], h, order)

% how to output function? 
% just output 

% how to define/initialize a "function" variable? 
% just f = zeros(len)

% matlab how to raise ValueError? 
% https://www.mathworks.com/help/matlab/ref/error.html
% msg = 'error'
% error(msg)

% how to print in matlab? 
% fprintf()

% what is the 3rd option? (last course) 

% what is the O(h) means? 
% this tells you how fast the error decrease with h. 
% h is NOT the smaller, the error is smaller 

%%  implementation
function [func_out]=Approx_gradient(func_in, x, h, order)

vec_len = length(x);

if order == 1 % 1st method
  
    f_x = func_in(x)
    f_x_h = zeros(vec_len);

    for i=1:vec_len
        x(i) = x(i) + h;
        f_x_h(i) = func_in(x(i));
    end

    func_out = 1/h * (f_x_h(x) - f_x(x));

elseif order == 2 % 2nd method

    f_x_minus_h = zeros(vec_len);
    f_x_plus_h  = zeros(vec_len);

    for i=1:vec_len
        x_plus_h(i)  = x(i) + h;
        x_minus_h(i) = x(i) - h;

        f_x_plus_h(i)  = func_in(x_plus_h(i));
        f_x_minus_h(i) = func_in(x_minus_h(i));
    end

    func_out = 1/(2 * h) * (f_x_plus_h(x) - f_x_minus_h(x));


elseif order ==3 % 3rd method

else 

end




end

