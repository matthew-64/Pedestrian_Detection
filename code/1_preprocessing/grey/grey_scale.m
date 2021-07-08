% Outputs all images as cell array after converying to grey scale

function [allGS] = grey_scale(path)
    contents = dir(path);
    allGS = {zeros(1, numel(contents))};
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
        allGS{k,:} = gsImg;
    end
end
