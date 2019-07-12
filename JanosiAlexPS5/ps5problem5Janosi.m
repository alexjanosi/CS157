% Problem 5a
twain = [0.225, 0.262, 0.217, 0.240, 0.230, 0.229, 0.235, 0.217];
snodgrass = [0.209, 0.205, 0.196, 0.210, 0.202, 0.207, 0.224, 0.223,...
    0.220, 0.201];

% Wald means
num = abs(mean(twain) - mean(snodgrass));
den = sqrt((var(twain)/length(twain)) + ...
    (var(snodgrass)/length(snodgrass)));

% z score bigger than 1.96 (z @ alpha = 0.05)
z1 = num / den;

% p value
p1 = 2*(1 - normcdf(z1));

% We reject the null hypothesis that they are equal

% Problem 5b
K = 10^6;

% s obs
s = abs(mean(twain) - mean(snodgrass));

% combine arrays
comb = [twain snodgrass];

% run permutation test
sum = 0;
for i = 1:K
    indices = randperm(18);
    perm = comb(:,indices);
    permmean = abs(mean(perm(1:8)) - mean(perm(9:18)));
    if permmean > s
        sum = sum + 1;
    end 
end

% p value
p2 = sum / K;

% reject null hypothesis

% Both p values are extremely small so it leads us to believe that the two
% averages are not equal. This suggests that Twain did not write the ten
% essays.
