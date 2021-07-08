k = 5;

% Ideal parameters found
num_trees = 212;
ndim = 11;

% Now preform 5 fold cross validation on ideal parameters:
[accuracies, predictions, evalMetrics] = test_random_forest_k_fold_pca(hogHE, labels, k, ndim, num_trees);