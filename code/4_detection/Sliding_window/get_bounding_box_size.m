function [x, y, width, height] = get_bounding_box_size(x, y,  samplingX, samplingY)

   x = x + samplingX/10;
   y = y + samplingY/10;
   width = samplingX - (samplingX/4);
   height = samplingY - (samplingY/4);
end