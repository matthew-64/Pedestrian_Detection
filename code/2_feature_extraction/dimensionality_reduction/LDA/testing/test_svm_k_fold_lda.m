function [accuracies, predictions, evalMetrics] = test_svm_k_fold_lda(data, labels, k, options)
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

        
        % For lda data:
        [eigenVectors, eigenvalues, meanX, Xlda] = LDA(training(:,1),options,training(:,2:7525));
        trainedSVMModel = SVMTraining(Xlda, training(:, 1));
        %rfModel = TreeBagger(num_trees,training(:, 2:size(training, 2)), training(:, 1),'Method', 'classification');
        
        
        %size(testing(:,2:size(testing, 2)))
        %size(meanX)
        %size(eigenVectors)
        
        test_lda = (testing(:,2:size(testing, 2)) - meanX) * eigenVectors;
        
        %[predictions, accuracy] = test_random_forest([testing(:,1) test_pca], rfModel);
        [predictions, accuracy] = test_svm([testing(:,1) test_lda], trainedSVMModel);
        
        accuracies(i) = accuracy;
        %[recall, precision, specificity, f_measure, false_alarm_rate] = conf_mat(testing, predictions);
        %evalMetrics(i,:) = [recall, precision, specificity, f_measure, false_alarm_rate];
    end
    accuracies = mean(accuracies);
    accuracies
end