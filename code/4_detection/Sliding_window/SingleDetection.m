function Objects = SingleDetection(y, x, step, image, trainedModel)

[height, width, ~] = size(image);


%created the scaling
numberRows=x;
numberColumns=y;

% Using previous infromation, we can calculate how tall and wide is each
% window
% this gathers the width and height of the window based on the scale
% eg if the scale is 1 the width will be 640 and the height will be 480/3(3 being 1 x 3)
samplingY=round(size(image,1)/numberRows);
samplingX=round(size(image,2)/numberColumns);

% variables to gather the x, y of the top left of each window
xs = [];
ys = [];

% score of the detection
confidence = [];
scores = [];
countY = 0;

predictedFullImage=[];

% creates a grid of steps 
[x, y] = ndgrid(1:step:(width-samplingX+1), 1:step:(height-samplingY+1)); 
x=x(:);

% first loop grows row by row
for r=1:step:size(image,1)
    % Increment x count 
    countY = countY + 1;
    % Initialise row count 
    countX = 0;


    predictedRow=[];
    
    % second loop goes column by column.
    for c= 1:step:size(image,2)
        % Increment X count 
        countX = countX + 1;
        
        % check that the steps doesnt go over the image size.
        if (c+samplingX-1 <= size(image,2)) && (r+samplingY-1 <= size(image,1))
        
        %we crop the digit
        digitIm = image(r:r+samplingY-1, c:c+samplingX-1);
       
        %All training examples were 160x96. To have any chance, we need to
        %resample them into a 160x96 image
        digitIm = imresize(digitIm, [160, 96]);
        
        % Preform dimensionality reduction
        %feature = (feature - load('meanX').meanX) * load('eigenVectors').eigenVectors;

        %gather features from cropped image
        feature = hog_feature_vector(digitIm);
        
        %getting the prediction         
        [prediction, score] =  SVMDetection(feature, trainedModel);
        
        %[prediction, maxi] = RFDetection(trainedModel, feature);
%         [Yfit,scores] = predict(trainedModel,feature);
%         prediction = str2double(Yfit);
%         maxi = max(scores);
        % getting the confidence
        % the confidence is added to maxtris to line it up with the steps
        % taken. meaning each step has a classification confidence.
        confidence(countX, countY) = score;
        
        % get the x and y of the step if the prediction is 1
        if prediction == 1
            % The below if defines the score threshold, higher is stricter
            % Too high and we get more false negatives
            % Too low and we get more false positives
            % The solution to a higher threshold is decreasing the steps
            % and increasing the range of scales - as this gives more
            % opportunties for a high score to come through.
            % However this increases preocessing time exponentially.
            if confidence(countX, countY) > 0.85
                prediction = 1;
                scores = [scores; confidence(countX, countY)];
                xs = [xs; c];
                ys = [ys; r];
            else
               prediction = 0; 
            end         
        end
        predictedRow=[predictedRow prediction];
        end
    end
    predictedFullImage=[predictedFullImage; predictedRow];
end
% flattening the predictions to line up with the steps
% this flattens the predicted values into a single vector so that the
% number of steps lines up with the number of predictions. so step 34 can
% line up with prediction 34 for example
predictedFullImage = predictedFullImage(:);
% gets rid of steps that dont have have a positive prediction
predictedFullImage = predictedFullImage > 0;
% reduces the steps to only those with confident predictions
x = x(predictedFullImage);

% adding detected objects
Objects=zeros(50,5); n = 0;
for k=1:length(x) 
   n = n + 1;
   
    % object properties are 
    % 1) x value for top left point
    % 2) y value for top left point
    % 3) samplingX is the width of the sliding window
    % 4) samplingY is the height of the sliding window
    % 5) is the confidence value from the svm
   Objects(n,:)=[xs(k) ys(k) samplingX samplingY scores(k)];
end


Objects = Objects(1:n ,:);

% applying nms to each row step to minimse the number of boxes
% Objects = NMS(Objects, 0.75);

end








