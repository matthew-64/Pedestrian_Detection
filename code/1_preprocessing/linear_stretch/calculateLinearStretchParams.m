function [m, c] = calculateLinearStretchParams(image, noise)
    
    [minVal, maxVal] = calculateLinearStretchRange(image, noise);
    
    range = maxVal - minVal;
    m = 255/range;
    
    c = -1 * m * minVal;
end
