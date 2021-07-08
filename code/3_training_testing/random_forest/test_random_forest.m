function [predictions, accuracy] = test_random_forest(testing, trainedRFModel)
size(testing)
    testSize = size(testing, 1);
    accuracies = zeros(testSize,1);
    predictions = zeros(testSize,1);
    for k = 1:testSize
        prediction = str2double(predict(trainedRFModel,testing(k, 2:size(testing, 2))));
        predictions(k,1) = prediction;
        if testing(k, 1) == prediction
            accuracies(k,1) = 1; % 1 = success
        else
            accuracies(k,1) = 0; % 0 = fail
        end
    end
    accuracy = mean(accuracies);
end
