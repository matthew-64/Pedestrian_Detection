labels(1:997,:) = 0;
labels(998:3000) = 1;
k = 5;
tic
%dims = [5, 10, 15, 25, 40, 50, 60, 75, 100, 125, 150, 175, 200, 225, 250, 275, 300, 350, 400, 450, 500, 550, 600, 650, 700, 750, 800, 850, 900, 950, 1000, 1500, 2000, 2500, 3000, 4000, 5000, 6000, 7000];
num_trees = 300;
oobErrorResults = zeros(num_trees,length(dims));
%[trainingHE, testingHE] = partition_hold_out(hogHE, labels, 0.2);
count = 0;
%for i = 1:5:500%length(dims)
    count = count + 1;
    ndim = 250;%dims(i)
    tic
    [eigenVectors, eigenvalues, meanX, Xpca] = PrincipalComponentAnalysis(hogHE, ndim);
    toc

    % train RF

    tic
    rfdr = RandomForestModel(Xpca,trainingHE(:,1),212);
    %rfdr = TreeBagger(num_trees,Xpca,labels,'Method', 'classification','OOBPrediction','on');
    toc
    plot(oobError(rfdr));
    oobErrorResults(:,count) = oobError(rfdr);
end

toc