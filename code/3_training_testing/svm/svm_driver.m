% Run preprocessing_driver.m & feature_extraction_driver.m first
clc;
k = 5;

%-------------------------HIST_EQ-HOG-SVM---------------------------------%

% 1) Partition
% [trainingHE, testingHE] = partition_hold_out(hogHE, labels, 0.2);
 
% 2) Train  the SVM model using libsvm 
% trainedSVMModelHE = SVMTraining(trainingHE(:,2:size(trainingHE,2)), trainingHE(:,1));
 
% 3) Testing the model (~93% accuracy)
% [predictionsHE, accuracyHE] = test_svm(testingHE, trainedSVMModelHE);

% 4) Show confusion matrix and summary statistics
% conf_mat(testingHE, predictionsHE);

% 5) Save Model for use
% save detectorModel trainedSVMModelHE;

% K-Fold
%[accuraciesHE, predictionsHE, evalMetricsHE] = test_svm_k_fold(hogHE, labels, k);

%-------------------------POWER_LAW-HOG-SVM-------------------------------%

% 1) Partition
% [trainingPL, testingPL] = partition_hold_out(hogPL, labels, 0.2);
 
% 2) Train the SVM model using libsvm - changed to 100% of images
trainedSVMModelPL = SVMTraining(hogPL, labels(:,1));

%trainedSVMModelPL = SVMTraining(trainingPL(:,2:size(trainingPL,2)), trainingPL(:,1));

% 3) Testing the model (~97% accuracy)
% [predictionsPL, accuracyPL] = test_svm(testingPL, trainedSVMModelPL);

% 4) Show confusion matrix and summary statistics
% conf_mat(testingPL, predictionsPL);

% 5) Save Model for use
save detectorModel trainedSVMModelPL;

% K-Fold
% [accuraciesPL, predictionsPL, evalMetricsPL] = test_svm_k_fold(hogPL, labels, k);

%----------------------LINEAR_STRETCHING-HOG-SVM--------------------------%

% 1) Partition
% [trainingLS, testingLS] = partition_hold_out(hogLS, labels, 0.2);
 
% 2) Train the SVM model using libsvm 
% trainedSVMModelLS = SVMTraining(trainingLS(:,2:size(trainingLS,2)), trainingLS(:,1));
 
% 3) Testing the model (~97% accuracy)
% [predictionsLS, accuracyLS] = test_svm(testingLS, trainedSVMModelLS);

% 4) Show confusion matrix and summary statistics
% conf_mat(testingLS, predictionsLS);

% 5) Save Model for use
% save detectorModel trainedSVMModelLS;

% K-Fold
%[accuraciesLS, predictionsLS, evalMetricsLS] = test_svm_k_fold(hogLS, labels, k);

%-------------------------------------------------------------------------%

% fileID = fopen('svm_comparative_results.txt','wt');
% fprintf(fileID, 'HE Results\n');
% fprintf(fileID, 'Accuracies = 1) %f, 2) %f, 3) %f, 4) %f, 5) %f\n', accuraciesHE);
% fprintf(fileID, 'Mean Accuracy = %f\n', mean(accuraciesHE));
% fprintf(fileID, 'Mean Recall = %f\n', mean(evalMetricsHE(1,:)));
% fprintf(fileID, 'Mean Precision = %f\n', mean(evalMetricsHE(2,:)));
% fprintf(fileID, 'Mean Specificity = %f\n', mean(evalMetricsHE(3,:)));
% fprintf(fileID, 'Mean F Measure = %f\n', mean(evalMetricsHE(4,:)));
% fprintf(fileID, 'Mean F.A.R = %f\n\n', mean(evalMetricsHE(5,:)));
% fprintf(fileID, 'PL Results\n');
% fprintf(fileID, 'Accuracies = 1) %f, 2) %f, 3) %f, 4) %f, 5) %f\n', accuraciesPL);
% fprintf(fileID, 'Mean Accuracy = %f\n', mean(accuraciesPL));
% fprintf(fileID, 'Mean Recall = %f\n', mean(evalMetricsPL(1,:)));
% fprintf(fileID, 'Mean Precision = %f\n', mean(evalMetricsPL(2,:)));
% fprintf(fileID, 'Mean Specificity = %f\n', mean(evalMetricsPL(3,:)));
% fprintf(fileID, 'Mean F Measure = %f\n', mean(evalMetricsPL(4,:)));
% fprintf(fileID, 'Mean F.A.R = %f\n\n', mean(evalMetricsPL(5,:)));
% fprintf(fileID, 'LS Results\n');
% fprintf(fileID, 'Accuracies = 1) %f, 2) %f, 3) %f, 4) %f, 5) %f\n', accuraciesLS);
% fprintf(fileID, 'Mean Accuracy = %f\n', mean(accuraciesLS));
% fprintf(fileID, 'Mean Recall = %f\n', mean(evalMetricsLS(1,:)));
% fprintf(fileID, 'Mean Precision = %f\n', mean(evalMetricsLS(2,:)));
% fprintf(fileID, 'Mean Specificity = %f\n', mean(evalMetricsLS(3,:)));
% fprintf(fileID, 'Mean F Measure = %f\n', mean(evalMetricsLS(4,:)));
% fprintf(fileID, 'Mean F.A.R = %f\n\n', mean(evalMetricsLS(5,:)));
% fclose(fileID);



