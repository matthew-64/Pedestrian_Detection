% TODO: Generify this function to be non-svm specific for reuse
function [accuracies, predictions, evalMetrics] = test_svm_k_fold(hogData, labels, k)
    merged = [labels hogData];
    CVO = cvpartition(merged(:, 1), 'KFold', k);
    accuracies = zeros(CVO.NumTestSets,1);
    predictions = zeros(CVO.NumTestSets,1);
    evalMetrics = zeros(CVO.NumTestSets,5);
    for i = 1:CVO.NumTestSets
        trIdx = CVO.training(i);
        teIdx = CVO.test(i);
        training = merged(trIdx, :);
        testing = merged(teIdx, :);
        trainedSVMModel = SVMTraining(training(:, 2:size(training, 2)), training(:, 1));
        [predictions, accuracy] = test_svm(testing, trainedSVMModel);
        accuracies(i) = accuracy;
        [recall, precision, specificity, f_measure, false_alarm_rate] = conf_mat(testing, predictions);
        evalMetrics(i,:) = [recall, precision, specificity, f_measure, false_alarm_rate];
    end
end