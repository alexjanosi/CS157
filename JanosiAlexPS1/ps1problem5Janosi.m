% Problem 5a

% importing data
import = importdata("birth.txt");

% indexing to get height
heights2 = import(:,5);

% getting rid of unknown
heights = heights2(heights2~=99);

% make a histogram
histogram(heights, 'Normalization', 'probability');

% 20 bins seem optimal for representing the shape since all the bars touch
% and the shape is well-defined.

% Problem 5b

% calculating the mean
mn = mean(heights);
% 64.04

% calculating the median
mdn = median(heights);
% 64

% calculating the standard deviation
sd = std(heights);
% 2.53

% calculating the IQR
IQRh = iqr(heights);
% 4

% The center seems well-defined around 64, since the median and mean are both
% approximately there.

% Problem 5c
% making boxplot
box = boxplot(heights);

% making eCDF
plot(ecdf(heights));

% QQ plot
qqplot(heights);

% Based on these graphs, I would say that this sample is approximately
% normal since the box plot has the mean at the right place with equal
% distances to Q1 and Q3. The eCDF almost matches the eCDF of a normal plot
% as well. We already have the mean as 64.04 and the standard deviation as
% 2.53.

% Problem 5d

% extract smokers and nonsmokers
smokedata = import(import(:,7)==1,:);
nosmokedata = import(import(:,7)==0,:);

% get height column
smokeheight2 = smokedata(:,5);
nsmokeheight2 = nosmokedata(:,5);

% get rid of unknown values
smokeheight = smokeheight2(smokeheight2~=99);
nsmokeheight = nsmokeheight2(nsmokeheight2~=99);

% boxplots
boxplot(smokeheight);
boxplot(nsmokeheight);

% The heights of smokers vs nonsmokers are almost identical. The means are
% both approximately 64.0. You can not say that one group is higher than
% the other as the means are almost identicaly and the Q1 - Q3 ranges
% overlap greatly.

