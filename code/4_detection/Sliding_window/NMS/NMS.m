function Objects = NMS(Objects, threshold)         

x = size(Objects);

deleteIndices = [];

for i = 1:(x-1)
    for j = (i+1):x
        intersectionArea = rectint(Objects(i, 1:4), Objects(j, 1:4));
        boundingArea = Objects(i, 3) * Objects(i, 4);
        boundingArea2 = Objects(j, 3) * Objects(j, 4);

        if((intersectionArea / boundingArea) > threshold)
            if(Objects(i, 5) > Objects(j, 5)), deleteIndices = [deleteIndices; j]; 
            else deleteIndices = [deleteIndices; i];
            end
        elseif((intersectionArea / boundingArea2) > threshold)
            if(Objects(i, 5) > Objects(j, 5)), deleteIndices = [deleteIndices; j]; 
            else deleteIndices = [deleteIndices; i];
            end
        end
    end
end

Objects(deleteIndices, :) = [];
end