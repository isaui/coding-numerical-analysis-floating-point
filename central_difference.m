format long;  % Meningkatkan presisi tampilan

function [approx, abs_error, rel_error] = forward_diff(x, k)
    h = double(10^(-k));  % Memastikan h adalah double
    f = @(x) sqrt(x);
    fprime_exact = 1 / (2 * sqrt(x));
    
    % Hitung aproksimasi dengan memastikan operasi double precision
    approx = (f(x + h) - f(x-h)) / (2*h);
    
    % Hitung error
    abs_error = abs(approx - fprime_exact);
    rel_error = abs_error / abs(fprime_exact);
end

x = double(4);  % Memastikan x adalah double
k_range = 1:20;

results = zeros(length(k_range), 5);

for i = 1:length(k_range)
    k = k_range(i);
    [approx, abs_error, rel_error] = forward_diff(x, k);
    results(i, :) = [k, x + double(10^(-k)), approx, abs_error, rel_error];
end

% Tampilkan hasil dengan presisi maksimal
disp('    k                x+h                f''(x) approx           Abs Error            Rel Error');
for i = 1:size(results, 1)
    fprintf('%5d %20.15f %20.15f %20.15e %20.15e\n', results(i,:));
end

% Tampilkan informasi tentang presisi mesin
disp(['Epsilon mesin: ' num2str(eps, '%20.15e')]);