function [predictions, accuracy] = test_svm(testing, trainedSVMModel)
    testSize = size(testing, 1);
    accuracies = zeros(testSize,1);
    predictions = zeros(testSize,1);
    for k = 1:testSize
        prediction = SVMTesting(testing(k, 2:size(testing, 2)), trainedSVMModel);
        predictions(k) = prediction;
        if testing(k, 1) == prediction
            accuracies(k) = 1; % 1 = success
        else
            accuracies(k) = 0; % 0 = fail
        end
    end
    accuracy = mean(accuracies) * 100;
end
