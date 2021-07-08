
function top = simpleNMS(Objects, threshold)        

if isempty(Objects)
    top = [];
else
    heights = Objects(:, 4);
    widths = Objects(:, 3); 
    confidences = Objects(:,end);
    areas = heights .* widths;

    [~, I] = sort(confidences);
    pick = [];
    while ~isempty(I)
        last = length(I);
        i = I(last);
        pick = [pick; i];
        suppress = last;
        for pos = 1:last-1
          j = I(pos);
          areaMax = max(areas(i), areas(j));
          if areaMax > 0
            o = rectint(Objects(i, 1:4), Objects(j, 1:4));
            if o > threshold
              suppress = [suppress; pos];
            end
          end
        end
        I(suppress) = [];
    end
    top = Objects(pick,:);
end