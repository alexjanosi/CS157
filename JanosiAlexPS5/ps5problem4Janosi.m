% Problem 4

soila = [7.58 8.52 8.01 7.99 7.93 7.89 7.85 7.82 7.80];
soilb = [7.85 7.73 8.53 7.40 7.35 7.30 7.27 7.27 7.23];

% value for k
K = 10^5;

% s obs
s = abs(mean(soila) - mean(soilb));

% combine arrays
comb = [soila soilb];

% run permutation test
sum = 0;
for i = 1:K
    indices = randperm(18);
    perm = comb(:,indices);
    permmean = abs(mean(perm(1:9)) - mean(perm(10:18)));
    if permmean > s
        sum = sum + 1;
    end 
end

% p value
p = sum / K;

% This gives strong evidence against the null hypothesis, which leads us to
% believe that the true mean soil pH values differ for the two locations
