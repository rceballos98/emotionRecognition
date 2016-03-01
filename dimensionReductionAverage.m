%% Dimension Reduction by Averaging 
function avgFeaturesPerSubject = dimensionReductionAverage(featureData)
avgFeaturesPerSubject = zeros(32,40,5);
featureName = 'de';
subNames = fieldnames(featureData);
vidNames = fieldnames(featureData.(char(subNames(1))));

for sub = 1:size(avgFeaturesPerSubject,1)
    for vid = 1:size(avgFeaturesPerSubject,2)
        features = featureData.(char(subNames(sub))).(char(vidNames(vid)));
        avgFeaturesPerSubject(sub,vid,:) = mean(features.(featureName),1);
    end
end

end
