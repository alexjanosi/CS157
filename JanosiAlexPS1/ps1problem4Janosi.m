% Problem 4a
% create 15 random normal points
array = normrnd(0,1,[1,15]);

% make a histogram
histogram(array);

% make a QQ plot
qqplot(array);

% The points do not appear to fall on a straight line. 
% The histogram is not symmetric, unimodal, and bell-shaped.
% For a majority of the cases, there are not enough points to
% meet these conditions.

% Problem 4b
% create 50 random normal points
array2 = normrnd(0,1,[1,50]);

% make a histogram
histogram(array2);

% make a QQ plot
qqplot(array2);

% The points do not appear to fall on a straight line. 
% The histogram is not symmetric and bell-shaped, but it is unimodal.

% create 100 random normal points
array3 = normrnd(0,1,[1,100]);

% make a histogram
histogram(array3);

% make a QQ plot
qqplot(array3);

% The points appear to fall on a line except for the tails.
% The histograms are mostly unimodal and symmetric but not bell-shaped.

% create 1000 random normal points
array4 = normrnd(0,1,[1,1000]);

% make a histogram
histogram(array4);

% make a QQ plot
qqplot(array4);

% The points on the QQ plot appear to fall on a straight line.
% The histograms are symmetric, unimodal, and bell-shaped.

% Problem 4c
% Trying different combinations below
array5 = normrnd(0,1,[1,750]);
qqplot(array5);

% After plugging in different values for n*, I found that the most stable
% sample size was around 750. Values smaller than 750 have variation before
% the tails on multiple runs, while values after 750 show no significant
% change in stability.