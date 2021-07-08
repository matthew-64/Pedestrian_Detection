function imageOut = apply_linear_stretch(imageIn)
    
    noise = 10;    

    %% calculate params
    [m, c] = calculateLinearStretchParams(imageIn, noise);

    %% stretch image
    [rows, cols] = size(imageIn);
    for row = 1:rows
        for col = 1:cols
            pixelValue = double(imageIn(row,col));
            pixelValue = pixelValue*m + c;
            if pixelValue > 255
                pixelValue = 255;
            else if pixelValue < 0
                pixelValue = 0;
                end
            end
            imageOut(row,col) = uint8(pixelValue);
        end
    end
end