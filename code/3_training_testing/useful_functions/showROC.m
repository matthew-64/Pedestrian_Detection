function [AUC] =  showROC(testingImages, model, process)
 
 predictions = [];
 scores = [];
 test_labels = [];
 
  for i=1:size(testingImages, 1)
   image = testingImages(i, 2:size(testingImages, 2));
   label = testingImages(i, 1);
   test_labels = [test_labels;label];
   [prediction, score] = SVMDetection(image, model);
   predictions = [predictions; prediction];
   scores = [scores; score];
  end
 
 [X,Y,T,AUC] = perfcurve(test_labels,scores,1);
 AUC = round(AUC, 3);
 
auc = num2str(AUC);

 s = strcat('ROC for "', process,'"', ' AUC: "', auc, '"');
plot(X,Y)
xlabel('False positive rate') 
ylabel('True positive rate')
title(s)

end
 
 
 