% https://www.imageeprocessing.com/2011/04/matlab-code-histogram-equalization.html
% Implemented and adapted following the above
function [histEqImg] = apply_hist_eq(gsImg)
    % Find histogram
    val = reshape(gsImg, [], 1);
    val = double(val);
    i = hist(val, 0:255);
    % Divide by total number of pixels
    output = i / numel(gsImg);
    % Calculate cumulative sum
    cSum = cumsum(output);
    % Perform transformation S=T(R) where S and R in the range [0 1]
    histEqImg = cSum(gsImg + 1);
    % Convert to uint8
    histEqImg = uint8(histEqImg * 255);
end