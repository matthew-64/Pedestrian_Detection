function [prediction, maxi] = RFDetection(image,model)
      [Yfit,scores] = predict(model,image)
      Yfit
      prediction = str2double(Yfit);
      maxi = max(scores);
end