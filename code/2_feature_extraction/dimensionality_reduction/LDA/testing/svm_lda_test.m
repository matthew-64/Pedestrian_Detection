labels(1:997,:) = 0;
labels(998:3000) = 1;
k = 5;
pecs = 0:10;
acc_results = zeros(length(pecs),1);
count = 0;

%for i = pecs
    %count = count + 1;
    %pca_ratio = (100-(i*2))/100
    options.PCARatio = 1;
    %tic
    % Split data
    [trainingPL, testingPL] = partition_hold_out(hogPL, labels, 0.2);

    % do lda on train data
    tic
    [eigenVectors, eigenvalues, meanX, Xlda] = LDA(trainingPL(:,1),options,trainingPL(:,2:7525));
    toc
    % Train svm
    tic
    trainedSVMModelPL = SVMTraining(Xlda, trainingPL(:,1));
    toc
    
    % make test pca:
    test_lda = (testingPL(:,2:7525) - meanX) * eigenVectors;
    
    % Test model
    'start'
    tic
    [predictions, accuracy] = test_svm([testingPL(:,1) test_lda], trainedSVMModelPL);
    toc
    'finish'
    acc_results(count,1) = accuracy;
    %[accuracies, predictions, evalMetrics] = test_svm_k_fold_lda(hogPL, labels, k, options);
    %acc_results(count,1) = accuracies
    
%end

