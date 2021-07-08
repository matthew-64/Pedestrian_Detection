labels(1:997,:) = 0;
labels(998:3000) = 1;
k = 5;

all_dims = 1025:25:2500;
acc_results = zeros(length(all_dims),1);
count = 0;

%for dims = all_dims
    tic
    %dims
    count = count + 1;
    % Split data
    [trainingPL, testingPL] = partition_hold_out(hogPL, labels, 0.2);

    % do pca on train data
    [eigenVectors, eigenvalues, meanX, Xpca] = PrincipalComponentAnalysis(trainingPL(:,2:7525), 325);
    
    % Train svm
    trainedSVMModelPL = SVMTraining(Xpca, trainingPL(:,1));
    
    % make test pca:
    test_pca = (testingPL(:,2:7525) - meanX) * eigenVectors;
    
    % Test model
    'start'
    tic
    [predictions, accuracy] = test_svm([testingPL(:,1) test_pca], trainedSVMModelPL);
    toc
    'finish'
    acc_results(count,1) = accuracy;
    
%end

