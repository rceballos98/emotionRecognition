function [Features] = makeFeatureStruct(deapData)
% Past filepaths
% path = 'T:\\CRB\\DEAP\\data\\';
% path = 'C:\\Users\\NYUAD\\Desktop\\CRB\\DEAP\\data\\';

%Declare Struct
Features = struct();
fprintf(1,'processing subjects: 0');

%For all files (each file contains data for one subject)
subNames = fieldnames(deapData.data);
for i = 1:length(subNames)
    %filenames less than 9 prepended with 0
    if(i < 10)
        fprintf(1,'\b%d',i); 
    else
        fprintf(1,'\b\b%d',i);
    end
    Features.(char(subNames(i))) = getFeaturesFromSubject(...
        deapData.data.(char(subNames(i))), deapData.info);    
end

% Very slow/ unopenable
%save(strcat(path,'deapData.'), 'deapData', '-v7.3');
end

% Access like so:
%EEG.data = deapData.s4.v6.data.eeg

     
    
    