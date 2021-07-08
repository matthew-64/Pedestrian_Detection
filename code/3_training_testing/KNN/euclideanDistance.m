function dEuc = euclideanDistance(sample1, sample2)
    % each image has many dimensions to be tested on, hence the for loop
    totalDistSquared = 0;
    numPixels = size(sample1,2);
    for i = 1:numPixels
        thisDistSquared = abs(sample1(1,i) - sample2(1,i))^2;
        totalDistSquared = totalDistSquared + thisDistSquared;
    end
    dEuc = sqrt(totalDistSquared);
end