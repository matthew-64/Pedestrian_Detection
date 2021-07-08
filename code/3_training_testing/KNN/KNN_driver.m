% Run preprocessing_driver.m & feature_extraction_driver.m first
clc;
KNN_k = 9;
folds_k = 5;
%%-------------------------HIST_EQ-HOG-KNN---------------------------------
disp('HE');
% K-Fold
[accuraciesHE, predictionsHE, evalMetricsHE] = test_KNN_k_fold(hogHE, labels, folds_k, KNN_k);
evalMetricsHE
accuraciesHE
%%-------------------------POWER_LAW-HOG-SVM-------------------------------
disp('PL');
% K-Fold
[accuraciesPL, predictionsPL, evalMetricsPL] = test_KNN_k_fold(hogPL, labels, folds_k, KNN_k);
evalMetricsPL
accuraciesPL

%%----------------------LINEAR_STRETCHING-HOG-SVM--------------------------
disp('LS');
% K-Fold
[accuraciesLS, predictionsLS, evalMetricsLS] = test_KNN_k_fold(hogLS, labels, folds_k, KNN_k);
evalMetricsLS
accuraciesLS
