function model = SVMTraining(images, labels)


% first we check if the problem is binary classification or multiclass
if max(labels)<2
    %binary classification
    
    %SVM software requires labels -1 or 1 for the binary problem
    labels(labels==0)=-1;

    %Initilaise and setup SVM parameters
    lambda = 1e-20;  
    C = 37.894;
    sigmakernel=3.465;
	kernel='rbf';
    
    modelFITSVM = fitcsvm(images, labels, 'KernelFunction',kernel,'KernelScale',sigmakernel,'boxconstraint',C, 'ScoreTransform', 'logit')

   % Calculate the support vectors
%     delete(gcp('nocreate'));
    % use core count as worker number this time, not thread count
%     parpool(4)
    
    %modelFITSVM = fitcsvm(images, labels, 'KernelFunction',kernel,'ScoreTransform', 'logit', 'OptimizeHyperparameters', 'auto', 'HyperparameterOptimizationOptions',struct('MaxObjectiveEvaluations',60, 'UseParallel', true))

    % create a structure encapsulating all the variables composing the model
    model.modelFITSVM = modelFITSVM;
    model.xsup = images(modelFITSVM.IsSupportVector,:);

    model.param.sigmakernel=sigmakernel;
    model.param.kernel=kernel;
   
    model.type='binary';
    
else
    %multiple class classification
    
    %SVM software requires labels from 1 to N for the multi-class problem
    labels = labels+1;
    nbclass=max(labels);
    
    %Initilaise and setup SVM parameters
    lambda = 1e-20;  
    C = Inf;
    kernel='rbf';
    
    T=templateSVM('Standardize',1,'Boxconstraint',C) ;
    % Calculate the support vectors
    classifier = fitcecoc(images,labels,'Learners', T);
    
    model.classifier = classifier;
    model.type='multiclass';
    
end

    
    
end