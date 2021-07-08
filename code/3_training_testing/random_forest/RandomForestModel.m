function [RFModel] = RandomForestModel(data,labels,num_trees)

if nargin < 3
    num_trees = 300;
end

RFModel = TreeBagger(num_trees, data, labels, 'Method', 'classification', 'OOBPrediction','on');
end

