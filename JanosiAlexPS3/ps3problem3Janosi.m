% Problem 3a

% importing data
import = importdata("fiji.txt");

% get magnitudes
mag = import(:,5);

% +/- term
diff = sqrt((1/2000) * log(2/0.05));

% plot ecdf
[f,x] = ecdf(mag);
figure
ecdf(mag)
hold on
ecdf(mag - diff)
ecdf(mag + diff)
xlim([4 6.5])
ylim([-0.2 1.2])
hold off

% Problem 3b
figure
plot(x,f)
hold on
plot(x, f - diff)
plot(x, f + diff)
ecdf(mag)
hold off
