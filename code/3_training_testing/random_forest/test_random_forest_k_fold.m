function [accuracies, predictions, evalMetrics] = test_random_forest_k_fold(data, labels, k)
size(labels)
size(data)
    merged = [labels data];
    CVO = cvpartition(merged(:, 1), 'KFold', k);
    accuracies = zeros(CVO.NumTestSets,1);
    predictions = zeros(CVO.NumTestSets,1);
    evalMetrics = zeros(CVO.NumTestSets,k);
    num_trees = 60;
    for i = 1:CVO.NumTestSets
        trIdx = CVO.training(i);
        teIdx = CVO.test(i);
        training = merged(trIdx, :);
        testing = merged(teIdx, :);
        tic
        rfModel = RandomForestModel(training(:, 2:size(training, 2)), training(:, 1));
        %rfModel = TreeBagger(num_trees,training(:, 2:size(training, 2)), training(:, 1),'Method', 'classification');
        toc
        tic
        [predictions, accuracy] = test_random_forest(testing, rfModel);
        toc
        accuracies(i) = accuracy;
        [recall, precision, specificity, f_measure, false_alarm_rate] = conf_mat(testing, predictions);
        evalMetrics(i,:) = [recall, precision, specificity, f_measure, false_alarm_rate];
    end
    accuracies = mean(accuracies);
end