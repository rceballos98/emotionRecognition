function [features] = getFeaturesFromSubject(sub, info)
features = struct();

% Iterate over each video
FS = info.fs;
BANDS = info.bands;
eMAP = info.mapping;

vidNames = fieldnames(sub);
for i = 1:size(vidNames)
  % Get video
  vid =  sub.(char(vidNames(i)));
  
  % add freq analysis
  vid = freqBands(vid.data.eeg, FS, BANDS);
  
  % get features
  features.(char(vidNames(i))) = extractFeaturesFromPSD(vid.f.pbc,eMAP);
end

