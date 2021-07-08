% Run preprocessing_driver.m & feature_extraction_driver.m first
% clc;
labels(1:997,:) = 0;
labels(998:3000) = 1;
k = 5;

%-------------------------HIST_EQ-HOG-RF---------------------------------%

% 1) Partition
% [trainingHE, testingHE] = partition_hold_out(hogHE, labels, 0.2);
 
% 2) Train  the RF model
% trainedRFModelHE = RandomForestModel(trainingHE(:,2:size(trainingHE,2)), trainingHE(:,1));
 
% 3) Testing the model
% [predictionsHE, accuracyHE] = test_random_forest(testingHE, trainedRFModelHE);

% 4) Show confusion matrix and summary statistics
% conf_mat(testingHE, predictionsHE);

% 5) Save Model for use
% save detectorModel trainedRFModelHE;

% K-Fold
%-------------------------POWER_LAW-HOG-SVM-------------------------------%

% 1) Partition
% [trainingPL, testingPL] = partition_hold_out(hogPL, labels, 0.2);
 
% 2) Train  the RF model
% trainedRFModelPL = RandomForestModel(training(:,2:size(trainingPL,2)), trainingPL(:,1));
 
% 3) Testing the model
% [predictionsPL, accuracyPL] = test_random_forest(testingPL, trainedRFModelPL);

% 4) Show confusion matrix and summary statistics
% conf_mat(testingPL, predictionsPL);

% 5) Save Model for use
% save detectorModel trainedRFModelPL;

% K-Fold
% [accuraciesPL, predictionsPL, evalMetricsPL] = test_random_forest_k_fold(hogPL, labels, k);

%----------------------LINEAR_STRETCHING-HOG-SVM--------------------------%

% 1) Partition
% [trainingLS, testingLS] = partition_hold_out(hogLS, labels, 0.2);

% 2) Train  the RF model

%trainedRFModelLS = RandomForestModel(hogLS,labels)

% 3) Testing the model
% [predictionsLS, accuracyLS] = test_random_forest(testingLS, trainedRFModelLS);

% 4) Show confusion matrix and summary statistics
% conf_mat(testingLS, predictionsLS);

% 5) Save Model for use
% save detectorModel trainedRFModelLS;

% K-Fold
% [accuraciesLS, predictionsLS, evalMetricsLS] = test_random_forest_k_fold(hogLS, labels, k);


%-----------------------------GREY_SCALE-HOG-SVM--------------------------%

% 1) Partition
% [trainingGS, testingGS] = partition_hold_out(hogGS, labels, 0.2);

% 2) Train  the RF model

%trainedRFModelGS = RandomForestModel(hogGS,labels)

% 3) Testing the model
% [predictionsGS, accuracyGS] = test_random_forest(testingGS, trainedRFModelGS);

% 4) Show confusion matrix and summary statistics
% conf_mat(testingGS, predictionsGS);

% 5) Save Model for use
% save detectorModel trainedRFModelGS;

% K-Fold
% [accuraciesGS, predictionsGS, evalMetricsGS] = test_random_forest_k_fold(hogGS, labels, k);