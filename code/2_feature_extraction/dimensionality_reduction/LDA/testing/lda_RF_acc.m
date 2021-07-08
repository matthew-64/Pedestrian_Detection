
num_trees = 55;

[trainingHE, testingHE] = partition_hold_out(hogHE, labels, 0.2);

% LDA train
tic
options.PCARatio = 0.98;
[eigenVectors, eigenvalues, meanX, Xlda] = LDA(trainingHE(:,1),options,trainingHE(:,2:7525));
toc

% train RF
tic
rfdr = RandomForestModel(Xlda,trainingHE(:,1),num_trees);
%rfdr = TreeBagger(300,Xlda,trainingHE(:,1),'Method', 'classification','OOBPrediction','on');
toc


 %make test pca:
test_lda = (testingHE(:,2:7525) - meanX) * eigenVectors;
tic
[predictions, accuracy] = test_random_forest([testingHE(:,1) test_lda], rfdr);
toc
accuracy