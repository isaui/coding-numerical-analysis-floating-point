format long;
function [f_approx, c_approx, f_abs_error, c_abs_error] = compare_diff(x, k)
    h = double(10^(-k));
    f = @(x) sqrt(x);
    fprime_exact = 1 / (2 * sqrt(x));

    % Forward difference
    f_approx = (f(x + h) - f(x)) / h;

    % Central difference
    c_approx = (f(x + h) - f(x - h)) / (2*h);

    % Absolute errors
    f_abs_error = abs(f_approx - fprime_exact);
    c_abs_error = abs(c_approx - fprime_exact);
end
x = double(4);
k_range = 1:20;
f_errors = zeros(length(k_range), 1);
c_errors = zeros(length(k_range), 1);
for i = 1:length(k_range)
    [~, ~, f_errors(i), c_errors(i)] = compare_diff(x, k_range(i));
end
% Plotting
figure;
semilogy(k_range, f_errors, 'r-o', k_range, c_errors, 'b-s');
xlabel('k');
ylabel('Absolute Error');
title('Comparison of Forward and Central Difference Methods');
legend('Forward Difference', 'Central Difference');
grid on;
% Display results
disp('    k     Forward Error     Central Error');
for i = 1:length(k_range)
    fprintf('%5d %16.8e %16.8e\n', k_range(i), f_errors(i), c_errors(i));
end