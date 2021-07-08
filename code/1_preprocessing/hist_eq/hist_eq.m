% Outputs all images as cell array after histogram equalisation
function [allHistEq] = hist_eq(path)
    contents = dir(path);
    allHistEq = {zeros(1, numel(contents))};
    for k = 1:numel(contents)
        filename = contents(k).name;
        img = imread(filename);
        % If RGB convert to grayscale
        [~, ~, numberOfColorChannels] = size(img);
        if numberOfColorChannels > 1
            gsImg = rgb2gray(img);
        else
            gsImg = img;
        end
        histEqImg = apply_hist_eq(gsImg); % not equiv to histeq(gsImg);
        allHistEq{k,:} = histEqImg;
    end
end
 
 

 
 
 