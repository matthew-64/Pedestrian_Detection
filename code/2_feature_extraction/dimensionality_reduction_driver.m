
% Leave the data you want un-commented
%data = ImagesMatrix(allHistEq);
%data = ImagesMatrix(allPL);
%data = ImagesMatrix(allLS);
%data = ImagesMatrix(allGS);
%data = hogHE;
data = hogPL;
%data = hogLS;
%data = hogGS;

ndim = 325;

% PCA
[eigenVectors, eigenvalues, meanX, reduced_features] = PrincipalComponentAnalysis(data, ndim);

% LDA
%[eigvector, eigvalue, meanX, reduced_features] = LDA(labels,[],data);

save eigenVectors eigenVectors
save meanX meanX
