% Generate hog vectors for HE, PL, LS
function [hog] = generate_hog(images)
    hog = {zeros(1, 3000)};
    for k = 1:3000
        hog{k, :} = hog_feature_vector(images{k});
    end
    hog = cell2mat(hog);
end