% Initialize arrays for Un and Ûn
U = zeros(1, 11);
U_hat = zeros(1, 11);

% Set initial conditions
U(1) = 1;
U(2) = -9;
U_hat(1) = 1.01;
U_hat(2) = -9.01;

% Calculate the next 9 terms for both sequences
for n = 3:11
    U(n) = (9/4) * U(n-2) - (35/4) * U(n-1);
    U_hat(n) = (9/4) * U_hat(n-2) - (35/4) * U_hat(n-1);
end

% Compare and display results
fprintf('n\tUn\t\tÛn\t\tDifference\n');
fprintf('------------------------------------------------\n');
for n = 2:10
    U_rounded = round(U(n+1) * 1e5) / 1e5;
    U_hat_rounded = round(U_hat(n+1) * 1e5) / 1e5;
    diff = round((U_hat_rounded - U_rounded) * 1e5) / 1e5;
    fprintf('%d\t%.5f\t%.5f\t%.5f\n', n, U_rounded, U_hat_rounded, diff);
end