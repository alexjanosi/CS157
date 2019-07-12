% Problem 1a

% importing data
import = importdata("fiji.txt");

% get magnitudes and stations
x = import(:,5);
y = import(:,6);

% make scatter plot
scatter(x,y);

% Problem 1b

% plug-in estimate is found on pdf
num = 0;
xsquare = 0;
ysquare = 0;
% calculate sums
for i = 1:1000
    num = num + ((x(i) - mean(x)) * (y(i) - mean(y)));
    xsquare = xsquare + (x(i) - mean(x))^2;
    ysquare = ysquare + (y(i) - mean(y))^2;
end

%overall estimate
answer1b = num/sqrt(xsquare * ysquare); 

% Problem 1c

% make list of pairs
pairs = [x y];

% bootstrap
reps = zeros(1000,1);
for k = 1:1000
    bsamp = datasample(pairs, 1000);
    reps(k) = corr(bsamp(:,1), bsamp(:,2));
end

% standard error
se = sqrt(var(reps));

% plot
figure
histogram(reps)
hold on
line([answer1b,answer1b],ylim,'LineWidth', 2,'Color','r');
legend('Replications','Estimated Theta');
hold off

% Problem 1d

% normal CI
ci = norminv([0.025 0.975], answer1b, se);

% pivot CI
pci = bootci(1000, @corr, x, y);

