function [recall, precision, specificity, f_measure, false_alarm_rate] = conf_mat(testing, predictions)
    C = confusionmat(testing(1:size(testing, 1), 1), predictions);
    confusionchart(C);
    TP = C(1, 1);
    FN = C(1, 2);
    FP = C(2, 1);
    TN = C(2, 2);
 
    recall = TP / (TP + FN);
    precision = TP / (TP + FP);
    specificity = TN / (TN + FP);
    f_measure = 2 * TP / (2 * TP + FN + FP);
    false_alarm_rate = 1 - specificity;
end