% TODO: Generify this function to be non-svm specific for reuse
function [accuracies, predictions, evalMetrics] = test_KNN_k_fold(hogData, labels, k_folds, k_KNN)
    merged = [labels hogData];
    CVO = cvpartition(merged(:, 1), 'KFold', k_folds);
    accuracies = zeros(CVO.NumTestSets,1);
    predictions = zeros(CVO.NumTestSets,1);
    evalMetrics = zeros(CVO.NumTestSets,k_folds);
    for i = 1:CVO.NumTestSets
        trIdx = CVO.training(i);
        teIdx = CVO.test(i);
        training = merged(trIdx, :);
        testing = merged(teIdx, :);
        trainedNNModel = NNtraining(training(:, 2:size(training, 2)), training(:, 1));
        
        tic
        [predictions, accuracy] = test_KNN(testing, trainedNNModel, k_KNN);
        toc
        
        accuracies(i,1) = accuracy;
        [recall, precision, specificity, f_measure, false_alarm_rate] = conf_mat(testing, predictions);
        evalMetrics(i,:) = [recall, precision, specificity, f_measure, false_alarm_rate];
    end
    evalMetrics = mean(evalMetrics);
    accuracies = mean(accuracies);
end