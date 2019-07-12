% Problem 3b
B = 10000;

% Monte Carlo
means = zeros(1,B);
for i = 1:B
    sample = 1+2*rand(10,1);
    means(i) = (max(sample)+min(sample))/2;
end

sum = 0;
for j = 1:B
    sum = sum + (means(j) - 2)^2;
end

% final answer
answer = sum/B;

% This is about half of the analytical version