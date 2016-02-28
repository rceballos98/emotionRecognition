function [deapData] = makeDEAPstruct(path)
% Past filepaths
% path = 'T:\\CRB\\DEAP\\data\\';
% path = 'C:\\Users\\NYUAD\\Desktop\\CRB\\DEAP\\data\\';

%Declare Struct
deapData = struct();
fprintf(1,'processing subjects: 0');

%For all files (each file contains data for one subject)
for i = 1:32
    
    %filenames less than 9 prepended with 0
    if(i < 10)
        fprintf(1,'\b%d',i); 
        subject = load(strcat(path, 's0', num2str(i), '.mat'));
    else
        fprintf(1,'\b\b%d',i);
        subject = load(strcat(path, 's', num2str(i), '.mat'));
    end
    
    
    subjectID = strcat('s', num2str(i));
    %for each trial, populate subject struct inside main database
    for v = 1:40
        videoID = strcat('v', num2str(v));
        deapData.(subjectID).(videoID).labels = subject.labels(v,:);
        %EEg data on channels 1:32, AUX data on channels 33:40
        deapData.(subjectID).(videoID).data = ...
            struct('eeg', squeeze(subject.data(v,1:32,:)),...
            'other',squeeze(subject.data(v,33:40,:)));
    end 
end

% Very slow/ unopenable
%save(strcat(path,'deapData.'), 'deapData', '-v7.3');
end

% Access like so:
%EEG.data = deapData.s4.v6.data.eeg

     
    
    