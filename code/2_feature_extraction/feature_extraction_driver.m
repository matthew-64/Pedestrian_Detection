% Run preprocessing_driver.m first
clc;
labels(1:997,:) = 0;
labels(998:3000) = 1;

%-------------------------GREY_SCALE-HOG----------------------------------%

% Generate the hog feature set for Grey Scale images
%[hogGS] = generate_hog(allGS);

%--------------------------HIST_EQ-HOG------------------------------------%

% Generate the hog feature set for Hist EQ images
%[hogHE] = generate_hog(allHistEq);

%--------------------------POWER_LAW-HOG----------------------------------%

% Generate the hog feature set for Power Law images
[hogPL] = generate_hog(allPL);

%----------------------LINEAR_STRETCHING-HOG------------------------------%

% Generate the hog feature set for Linear Stretching images
%[hogLS] = generate_hog(allLS);






