function [sub] = addFeaturesToSubject(sub, info)

% Iterate over each video
FS = info.fs;
BANDS = info.bands;
eMAP = info.mapping;

vidNames = fieldnames(sub);
for i = 1:size(vidNames)
  % Get video
  vid =  sub.(char(vidNames(i)));
  
  % add freq analysis
  vid.fb = freqBands(vid.data.eeg, FS, BANDS);
  
  % add features
  vid.features = extractFeatures(vid.fb.f.pbc,eMAP);
  
  % Save changes
  sub.(char(vidNames(i))) = vid;
end

