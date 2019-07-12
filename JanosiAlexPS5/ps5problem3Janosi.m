% Problem 3b

sample = poissrnd(1, 1, 20);

% numerator
num = mean(sample) - 1;

% denominator
den = sqrt(mean(sample)/20);

result = abs(num/den);

% the result in most cases is less than 1.96, so we do not reject

m = 10^4;
sum = 0;
for i = 1:m
    sample2 = poissrnd(1, 1, 20);
    num2 = mean(sample2) - 1;
    den2 = sqrt(mean(sample2)/20);
    result2 = abs(num2/den2);
    
    if result2 > 1.96
        sum = sum + 1;
    end
end

rate = sum / m;

% type I error rate is fairly low