function [images, proc_images]  = loadPedestrians(type)
 path = 'pedestrian/*.jpg';
 contents = dir('pedestrian/*.jpg');
   for k = 1:numel(contents)
      filename  = contents(k).name;
      images{k} = imread(filename);
   end
   switch type
       case 'PL'
           proc_images = power_law(path);
       case 'HE'
           proc_images = hist_eq(path);
       case 'LS'
           proc_images = linear_stretch(path);
   end
end