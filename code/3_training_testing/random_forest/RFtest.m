%% find optimal number of trees
%b = TreeBagger(100,hogHE(5:3000,:),labels(5:3000,:),'Method', 'classification', 'OOBPrediction','on')
%       plot(oobError(b))
%toc

%out = predict(b,hogHE(1:4,:))

   
%       xlabel('number of grown trees')
%ylabel('out-of-bag classification error')

%[accuracies, predictions, evalMetrics] = test_random_forest_k_fold(hogHE, labels, 5);
%accuracies

%% pratice normally
tic
rf = TreeBagger(60,hogHE(5:3000,:),labels(5:3000,:),'Method', 'classification', 'OOBPrediction','on')
toc
str2double(predict(rf,hogHE(1:4,:))) == labels(1:4,:)



%% other stuff 
% 1) Partition
[trainingHE, testingHE] = partition_hold_out(hogHE, labels, 0.2);
tic
% 2) Train the RF model
trainedRFModelHE = RandomForestModel(trainingHE(:,2:size(trainingHE,2)), trainingHE(:,1));
toc
tic
% 3) Testing the model (~97% accuracy)
[predictionsHE, accuracyHE] = test_random_forest(testingHE, trainedRFModelHE);
toc
accuracyHE



% 1) Partition
[trainingPL, testingPL] = partition_hold_out(hogPL, labels, 0.2);
tic
% 2) Train the RF model
trainedRFModelPL = RandomForestModel(trainingPL(:,2:size(trainingPL,2)), trainingPL(:,1));
toc
tic
% 3) Testing the model (~97% accuracy)
[predictionsPL, accuracyPL] = test_random_forest(testingPL, trainedRFModelPL);
toc
accuracyPL
