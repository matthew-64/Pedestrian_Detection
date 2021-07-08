function [X] = ImagesMatrix(images)

[row, col] = size(images{1}); % assume all images are the same size
num_images = length(images);
X = zeros(num_images, row*col);

for i = 1:num_images
    X(i,:) = reshape(images{i},1,[]);
end
end

