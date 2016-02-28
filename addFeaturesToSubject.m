function [sub] = addFeaturesToSubject(sub, FS, BANDS)

% Iterate over each video
vidNames = fieldnames(sub);
for i = 1:size(vidNames)
  % Get video
  vid =  sub.(char(vidNames(i)));
  
  % add freq analysis
  vid.fb = freqBands(vid.data.eeg, FS, BANDS);
  
  %%KEEP WORKING
  % add features
  vid.features = extractFeatures(vid.fb.f.pbc,%add mappings );
  
  % Save changes
  sub.(char(vidNames(i))) = vid;
end

