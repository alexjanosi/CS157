% This is the value in part a that is compared to in parts b and c
actual = exp(5)*(exp(1/200)-1);

% Problem 5b

% generate data
data = normrnd(5,1,[1,100]);

% generate expected value
sum = 0;
for i = 1:length(data)
    jsample = data;
    jsample(i) = [];
    sampmean = mean(jsample);
    sum = sum + exp(1)^sampmean;
end

expect = sum / length(data);

% calculate bias
answer5b = 99 * (expect - exp(1)^mean(data));

% The bias calculated through the jackknife method is approximately the
% same as the value given in part a. It varies around 0.7439, but it is
% around it for the most part.

% Problem 5c

% create arrays for storage
normalbias = zeros(1,10^4);
jackbias = zeros(1,10^4);

for j = 1:10^4
    % generate new sample
    newdata = normrnd(5,1,[1,100]);
    
    % calculate theta bar
    sum = 0;
    for i = 1:length(data)
        jsample = newdata;
        jsample(i) = [];
        sampmean = mean(jsample);
        sum = sum + exp(1)^sampmean;
    end
    expect = sum / length(data);
    
    % calculate theta hat
    normalbias(j) = exp(1)^mean(newdata);
    
    % bias of the theta hat using jackknife method
    bias = 99 * (expect - exp(1)^mean(newdata));
    
    % calculating theta hat J
    jackbias(j) = exp(1)^mean(newdata) - bias;
    
end

% calculate final bias
b1 = mean(normalbias) - exp(1)^5;
b2 = mean(jackbias) - exp(1)^5;

% We see that b1 is approximately equal to the equation in part a and that
% b1 is always larger than b2.

