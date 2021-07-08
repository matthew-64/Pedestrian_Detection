% Set up environment variables for preprocessed images here 
clc;
path = 'images/**/*.jpg';
%------------------------------GREY_SCALE---------------------------------%

% [allGS] = grey_scale(path);
 
%------------------------------HIST_EQ------------------------------------%
 
% [allHistEq] = hist_eq(path);
 
%------------------------------POWER_LAW----------------------------------%
 
[allPL] = power_law(path);
 
%---------------------------LINEAR_STRETCHING-----------------------------%
 
% [allLS] = linear_stretch(path);
 
clear path;




