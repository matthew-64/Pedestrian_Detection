function [predictions, accuracy] = test_KNN(testing, trainedNNModel, k)
    testSize = size(testing,1);
    accuracies = zeros(testSize,1);
    predictions = zeros(testSize,1);
    for i = 1:size(testing, 1)
        prediction = KNNTesting(testing(i, 2:size(testing, 2)), trainedNNModel, k);
        predictions(i) = prediction;
        if testing(i, 1) == prediction
            accuracies(i,1) = 1; % 1 = success
        else
            accuracies(i,1) = 0; % 0 = fail
        end
    end
    accuracy = mean(accuracies);
end
