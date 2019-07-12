% Problem 3a

% importing data
import = importdata("birth.txt");

% indexing to get weight
weights3 = import(:,1);

% get rid of unknown
weights2 = weights3(weights3~=999);

% convert to kg
weights = weights2 *  0.0283495;

% compute mean 
popmean = mean(weights);

% take sample and mean
sample = datasample(weights, 40);
sampmean = mean(sample);

% std error
stderr = (std(weights)/sqrt(40)) * ...
    (sqrt(1-(39/(length(weights)-1))));

% Problem 3b
% create array of random sample means
ogsamp2 = datasample(weights,40);
bp = repmat(ogsamp2, 31, 1);

meanarray = zeros(1);
for i = 1:1000
    meanarray(i) = mean(datasample(bp,40));
end

% perform bootstrap
sum = 0;
partsum = mean(meanarray);
for k = 1:1000
    sum = sum + (meanarray(k) - partsum)^2;
end
bootstr = sqrt(1/1000 * sum);

% Problem 3c
r = rem(length(weights), 40);
k = floor(length(weights)/40);
p = (1 - r/40) * (1 - (40/(length(weights) - 1)));
notp = 1 - p;

% one sample
ogsamp = datasample(weights,40);

bp1 = repmat(ogsamp, k, 1);
bp2 = repmat(ogsamp, k + 1, 1);

bootpop = zeros(1);

% create population
for b = 1:1000
    test = rand();
    if test < p
        bootpop(b) = mean(datasample(bp1, 40));
    else
        bootpop(b) = mean(datasample(bp2, 40));

    end
end

% perform bootstrap
sum2 = 0;
partsum2 = mean(bootpop);
for l = 1:1000
    sum2 = sum2 + (bootpop(l) - partsum2)^2;
end
bootstr2 = sqrt(1/1000 * sum2);


% Problem 3d

alg1 = zeros(1);
alg2 = zeros(1);

% 100 runs for method b
for i = 1:100
    meanarray = zeros(1);
    for m = 1:1000
        meanarray(m) = mean(datasample(weights,40));
    end

    % perform bootstrap
    sum = 0;
    partsum = mean(meanarray);
    for n = 1:1000
        sum = sum + (meanarray(n) - partsum)^2;
    end
    alg1(i) = sqrt(1/1000 * sum);
end 

% 100 runs for method c
for i = 1:100
    ogsamp = datasample(weights,40);

    bp1 = repmat(ogsamp, k, 1);
    bp2 = repmat(ogsamp, k + 1, 1);

    bootpop = zeros(1);

    % create population
    for b = 1:1000
        test = rand(0,1);
        if test < p
            bootpop(b) = mean(datasample(bp1, 40));
        else
            bootpop(b) = mean(datasample(bp2, 40));

        end
    end

    % perform bootstrap
    sum2 = 0;
    partsum2 = mean(bootpop);
    for l = 1:1000
        sum2 = sum2 + (bootpop(l) - partsum2)^2;
    end
    alg2(i) = sqrt(1/1000 * sum2);
    
end

% final boxplots
figure;
boxplot([transpose(alg1), transpose(alg2), repmat(stderr, 100, 1)], ...
    'Labels', {'Part b', 'Part c', 'True Value'});
