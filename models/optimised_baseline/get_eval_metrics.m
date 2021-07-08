clc;

load('models/optimised_baseline_metrics.mat');

% col 1 = accuracy per image
mean_accuracy = mean(output_metrics(:,1));
% col 2 = TP
TP = sum(output_metrics(:, 2));
% col 3 = FP
FP = sum(output_metrics(:,3));
% col 4 = FN
FN = sum(output_metrics(:,4));

recall = TP / (TP + FN);
precision = TP / (TP + FP);
% specificity = TN / (TN + FP);
f_measure = 2 * TP / (2 * TP + FN + FP);
% false_alarm_rate = 1 - specificity;

% Too cumbersome to calculate true negatives and unknown quantity.



