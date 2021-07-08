function prediction = KNNTesting(testImage, modelNN, k)
    %% Store image and siatance distance in a martic with 2 cols
    % col 1 = label
    % col 2 = distance
    numImagesInModel = size(modelNN.neighbours,1);
    results = zeros(numImagesInModel,2);
    results(1:numImagesInModel,1) = Inf; % Set the distance to infinity
    
    %% Calculate eucaladian distance for each image in modelNN
    for i = 1:numImagesInModel
        modelImage = modelNN.neighbours(i,:);
        modelLabel = modelNN.labels(i,:);
        eucDist = euclideanDistance(testImage, modelImage);
        % record result
        results(i,:) = [eucDist, modelLabel];
    end
    
    %% Select the k nearest neighbours
    % sort the matrix in order of distance, closest first
    %sortedResults = sort(results);
    sortedResults = sortrows(results,1); % col 1 is the distance
    nearestNeighbours = sortedResults(1:k,2);
    
    prediction = mode(nearestNeighbours);
end