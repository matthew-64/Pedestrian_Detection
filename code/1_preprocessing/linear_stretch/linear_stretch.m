% Outputs all images as cell array after linear stretch
function [allLS] = linear_stretch(path)
    contents = dir(path);
    allLS = {zeros(1, numel(contents))};
    for i = 1:numel(contents)
        filename = contents(i).name;
        img = imread(filename);
        % If RGB convert to grayscale
        [~, ~, numberOfColorChannels] = size(img);
        if numberOfColorChannels > 1
            gsImg = rgb2gray(img);
        else
            gsImg = img;
        end
        stretchedImg = apply_linear_stretch(gsImg); % not equiv to histeq(gsImg);
        allLS{i,:} = stretchedImg;
    end

end