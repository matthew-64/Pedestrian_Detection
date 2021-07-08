function [training, testing] = partition_hold_out(data, labels, holdOut)
    % The first column will be labels
    merged = [labels data];
    % (train: 70%, test: 30%) - Stratified proportionately by label
    cv = cvpartition(merged(:, 1), 'HoldOut', holdOut);
    idx = cv.test;
    % Output training and testing partitions
    training = merged(~ idx, :);
    testing = merged(idx, :);
end