labels(1:997,:) = 0;
labels(998:3000) = 1;
k = 5;
tic
num_trees = 300;
oobErrorResults = zeros(num_trees,length(dims));
%[trainingHE, testingHE] = partition_hold_out(hogHE, labels, 0.2);
count = 0;
for i = 1:5:500%length(dims)
    count = count + 1;
    ndim = i%dims(i)
    tic
    [eigenVectors, eigenvalues, meanX, Xpca] = PrincipalComponentAnalysis(hogHE, ndim);
    toc

    % train RF

    tic
    %rfdr = RandomForestModel(Xpca,trainingHE(:,1),100);
    rfdr = TreeBagger(num_trees,Xpca,labels,'Method', 'classification','OOBPrediction','on');
    toc
    plot(oobError(rfdr));
    oobErrorResults(:,count) = oobError(rfdr);
end

toc