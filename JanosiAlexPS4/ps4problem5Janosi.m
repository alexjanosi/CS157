% Problem 5b

% draw sample
sample = rand(1,50);
m = max(sample);
% run bootstrap
nonpara = zeros(1,10000);
para = zeros(1,10000);
for i = 1:10000
    nonpara(i) = max(datasample(sample, 50));
    psamp = (m)*rand(1,50);
    para(i) = max(psamp);
end

% make plot
figure
fplot(@(x) (50.*x.^49),[0.85,1])
hold on
histogram(nonpara, 'Normalization', 'pdf')
histogram(para, 'Normalization', 'pdf')
legend({'Part a','Nonparametric', 'Parametric'},'Location', 'northwest')
hold off

% The true distriubtion fits the parametric histogram most of the time
% but it does not really fit the nonparametric since it is broken up more.