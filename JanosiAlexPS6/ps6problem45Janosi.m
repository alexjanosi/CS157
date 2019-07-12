% Problem 4a

% load data
file = matfile('advertising.mat');
sales = file.sales;
tv = file.tv;

figure
scatter(tv, sales);

% Problem 4b

% Calculating beta_1 and beta_0
num = 0;
den = 0;
for i = 1:length(sales)
    num = num + ((tv(i) - mean(tv)) * (sales(i) - mean(sales)));
    den = den + (tv(i) - mean(tv))^2;
end

beta1 = num / den;
beta0 = mean(sales) - beta1 * mean(tv);
% b0 = 7.0326
% b1 = 0.0475


% make plot with line
figure
scatter(tv, sales)
hold on
plot(tv, beta1 * tv + beta0)
hold off

% Problem 4c
res = zeros(length(tv), 1);
for j = 1:length(tv)
    res(j) = sales(j) - (beta1 * tv(j) + beta0);
end

% Plot residuals vs predictor and y = 0 for reference
figure
scatter(tv, res);
hold on
plot(tv, 0 * tv)
hold off

% The homoscedasticity assumption does not hold because we can see an
% increase as you move forward

% Problem 5a

% load data
file = matfile('advertising.mat');
sales = file.sales;
tv = file.tv;

% getting rid of X <= 50 and rescaling Y
for k = length(tv):-1:1
    if tv(k) <= 50
        sales(k) = [];
        tv(k) = [];
    else
        sales(k) = log(sales(k));
    end
end

figure
scatter(tv, sales);

% Problem 5b

% Calculating beta_1 and beta_0
num = 0;
den = 0;
for i = 1:length(sales)
    num = num + ((tv(i) - mean(tv)) * (sales(i) - mean(sales)));
    den = den + (tv(i) - mean(tv))^2;
end

beta1 = num / den;
beta0 = mean(sales) - beta1 * mean(tv);
% b0 = 2.1997
% b1 = 0.0028

% make plot with line
figure
scatter(tv, sales)
hold on
plot(tv, beta1 * tv + beta0)
hold off

% Problem 5c

res = zeros(length(tv), 1);
for j = 1:length(tv)
    res(j) = sales(j) - (beta1 * tv(j) + beta0);
end

% Plot residuals vs predictor and y = 0 for reference
figure
scatter(tv, res);
hold on
plot(tv, 0 * tv)
hold off

% The homoscedasticity assumption seems reasonable since the residuals vs
% predictors graph is balanced
