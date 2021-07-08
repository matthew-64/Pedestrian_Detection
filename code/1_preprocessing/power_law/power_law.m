function [allPL] = power_law(path)
    contents = dir(path);
    allPL = {zeros(1, numel(contents))};
    for k = 1:numel(contents)
        filename = contents(k).name;
        img = imread(filename);
        if size(img, 3) == 3
            gsImg = rgb2gray(img);
        else
            gsImg = img;
        end
        mn = mean(mean(gsImg));
        [height, width] = size(gsImg);
        if mn < 125
            gamma = 0.5;
        else
            gamma = 1.3;
        end
        for m = 1:height
            for n = 1: width
                gsImg(m, n) = apply_power_law(double(gsImg(m, n)), gamma);
            end
        end
        allPL{k, :} = gsImg;
    end
end
