% This is a function to find the range over which a linear streatch should
% take place.

% The noise is how many pixels in/out from the max/min recorded pixel
% values should the max/min for the linear streatch take place.

function [minVal, maxVal] = calculateLinearStretchRange(image, noise)
    sortedImage = sort(image(:));
    minVal = double(sortedImage(noise+1,1));
    maxVal = double(sortedImage(length(sortedImage)-noise-1,1));
end