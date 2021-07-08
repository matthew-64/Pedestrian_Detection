function [accuracies, predictions, evalMetrics] = test_random_forest_k_fold_pca(data, labels, k, ndim, num_trees)
    merged = [labels data];
    CVO = cvpartition(merged(:, 1), 'KFold', k);
    accuracies = zeros(CVO.NumTestSets,1);
    %predictions = zeros(CVO.NumTestSets,1);
    evalMetrics = zeros(CVO.NumTestSets,k);
    for i = 1:CVO.NumTestSets
        trIdx = CVO.training(i);
        teIdx = CVO.test(i);
        training = merged(trIdx, :);
        testing = merged(teIdx, :);

        tic
        % For pca data:
        [eigenVectors, eigenvalues, meanX, Xpca] = PrincipalComponentAnalysis(training(:,2:size(training, 2)), ndim);
        rfModel = RandomForestModel(Xpca, training(:, 1), num_trees);
        %rfModel = TreeBagger(num_trees,training(:, 2:size(training, 2)), training(:, 1),'Method', 'classification');
        toc
        tic
        %size(testing(:,2:size(testing, 2)))
        %size(meanX)
        %size(eigenVectors)
        
        test_pca = (testing(:,2:size(testing, 2)) - meanX) * eigenVectors;
        
        [predictions, accuracy] = test_random_forest([testing(:,1) test_pca], rfModel);
        toc
        accuracies(i) = accuracy;
        [recall, precision, specificity, f_measure, false_alarm_rate] = conf_mat(testing, predictions);
        evalMetrics(i,:) = [recall, precision, specificity, f_measure, false_alarm_rate];
    end
    accuracies = mean(accuracies);
    accuracies
end