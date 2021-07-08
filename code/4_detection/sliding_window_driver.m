%close all;
%clear all;
clc;
tic
% Loads the detector model created before
load('models/optimised_baseline/optimised_baseline_model.mat');
%load ('detectorModel.mat'); % use this matrix for dimensionality reduction

% gather pedestrian images
[images, proc_images] = loadPedestrians('PL');

% scales of the sliding windows
%these divide the width and hieght of the image. and from there each
%section is processed

scaleX = 1:0.1:5;

% scaleX = 1:0.2:3;

% Clears worker threads in case any exist
delete(gcp('nocreate'));
% Change this to your number of threads (if you don't mind maxing out CPU)
% Otherise change this to number of cores or number of threads - 2.
n_workers = 4;
parpool(n_workers)
  
% creating video Object
vidObj2 = VideoWriter('pedestrian.mp4', 'MPEG-4');

% set framerate for video
vidObj2.FrameRate = 5;

% open the video object
open(vidObj2);

total_objects = zeros(100,100);

% loop for processing each image x scale
for i=1:size(images, 2)
    Objects = [];  
    
    %loop for processing each sliding window scale  
    % objects returned are all objects found in all sliding windows scales
    tic
    % Creates a parallel for loop, utilising the specified number of
    % workers
    parfor y = 1:size(scaleX, 2)
        step = 20;
        object_ = SingleDetection(scaleX(y) * 3, scaleX(y), step, proc_images{i}, trainedSVMModelPL);
        Objects = [Objects; object_];
    end
    toc
    %checks the nms again for the objects returned
    Objects = NMS(Objects, 0.8);
    
    %  resizing the dection windows returned containing objects.
    %  this is to better show the pedestrain contained within it
    for n=1:size(Objects, 1)
        [Objects(n,1), Objects(n,2),Objects(n,3), Objects(n,4)] = get_bounding_box_size(Objects(n,1), Objects(n,2),Objects(n,3), Objects(n,4));  
    end
    
    imshow(images{i});
    for l=1:size(Objects,1)
        % Show detection as green rectangle
        rectangle('Position', [Objects(l, 1), Objects(l,2), Objects(l,3),Objects(l,4)], 'LineWidth', 1, 'EdgeColor', 'g');
        % Show the score as well, in red (comment out if annoying)
        text('Position', [Objects(l,1) + 10, Objects(l,2) + 10], 'string', Objects(l,5), 'Color', 'r');
    end
    
    %adds the object boxes to the image     
    %ShowDetectionResult(images{i}, Objects);
    
    reshaped = reshape(Objects.',1,[]);
        
    total_objects(i,1:size(reshaped,2)) = reshaped;
        
    %adds the frame to the video    
    writeVideo(vidObj2, getframe());   
end
% closes videos
close(vidObj2);
toc

 

