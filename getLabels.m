function [labels] = getLabels(deapData)
labels = zeros(32,40,2);

subNames = fieldnames(deapData.data);
vidNames = fieldnames(deapData.data.(char(subNames(1))));

%Iterate over subjects and videos
for sub = 1:size(labels,1)
    for vid = 1:size(labels,2)
        %first label is Valance, seconds is Arousal
        labels(sub,vid,:) = deapData.data.(char(subNames(sub))).(char(vidNames(vid))).labels(1:2);
    end
end
end