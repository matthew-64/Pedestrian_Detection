function ShowDetectionResult(Picture, Objects)
% Show the picture
imshow(Picture); hold on;
colours =['b';'c';'m';'y'; 'w';'r'];
% Show the detected objects
if(~isempty(Objects))
    for n=1:size(Objects,1)
        x1=Objects(n,1); 
        y1=Objects(n,2);
        x2=x1+Objects(n,3); 
        y2=y1+Objects(n,4);
        
        % confidence level gathered from the predict function. the return
        % is divided by the highest number, giving the highest confidence
        % from the values given.
        confidence = Objects(n,5)/ max(Objects(:,5));

            if confidence > 0.8
                c=1;
            elseif confidence > 0.6
                c=2;
            elseif confidence > 0.4
                c=3;
            elseif confidence > 0.3
                c=4;
            elseif confidence > 0.2
                c=5;
            else
                c=6;
            end
            % plotting the object values onto the image
            plot([x1 x2 x2 x1 x1],[y1 y1 y2 y2 y1],colours(c));
    end
end
