labels(1:997,:) = 0;
labels(998:3000) = 1;

num_trees = 300;
percentages = 1:100;

acc_results = zeros(num_trees,length(percentages));

for i = percentages
    i
    options.PCARatio = (i/100);
    
    tic
    [eigenVectors, eigenvalues, meanX, Xlda] = LDA(labels,options,hogHE);
    toc

    % train RF

    tic
    %rfdr = RandomForestModel(Xpca,trainingHE(:,1),100);
    rfdr = TreeBagger(num_trees,Xlda,labels,'Method', 'classification','OOBPrediction','on');
    toc
    plot(oobError(rfdr));
    acc_results(:,i) = (1-oobError(rfdr));
end


%options.PCARatio = 0.99;
%[eigvector, eigvalue, meanX, Xlda] = LDA(labels,[],hogHE);
%num_trees = 300;
%rfdr = TreeBagger(num_trees,Xlda,labels,'Method', 'classification','OOBPrediction','on');

%plot(oobError(rfdr))

%[trainingHE, testingHE] = partition_hold_out(hogHE, labels, 0.2);
%ndim = 250;
%tic
%[eigenVectors, eigenvalues, meanX, Xlda] = LDA(trainingHE(:,1),[],trainingHE(:,2:7525));
%toc

% train RF

%tic
%rfdr = RandomForestModel(Xpca,trainingHE(:,1),100);
%rfdr = TreeBagger(300,Xlda,trainingHE(:,1),'Method', 'classification','OOBPrediction','on');
%toc

%plot(oobError(rfdr))

% make test pca:
%test_lda = (testingHE(:,2:7525) - meanX) * eigenVectors;

%[predictions, accuracy] = test_random_forest([testingHE(:,1) test_lda], rfdr);
%accuracy