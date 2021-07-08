labels(1:997,:) = 0;
labels(998:3000) = 1;
k = 5;

[trainingHE, testingHE] = partition_hold_out(hogHE, labels, 0.2);
ndim = 11;
tic
[eigenVectors, eigenvalues, meanX, Xpca] = PrincipalComponentAnalysis(trainingHE(:,2:7525), ndim);
toc

% train RF

tic
rfdr = RandomForestModel(Xpca,trainingHE(:,1),100);
%rfdr = TreeBagger(212,Xpca,trainingHE(:,1),'Method', 'classification','OOBPrediction','on');
toc

plot(oobError(rfdr))

% make test pca:
test_pca = (testingHE(:,2:7525) - meanX) * eigenVectors;

[predictions, accuracy] = test_random_forest([testingHE(:,1) test_pca], rfdr);