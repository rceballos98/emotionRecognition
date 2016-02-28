basePath = 'C:\\Users\\NYUAD\\Desktop\\CRB\\DEAP\\';
subjectPath = 'data\\s01.mat';

% Load data for individual subject
s01 = load(basePath+subjectPath);
s01Data = s01.data();
s01Labels = s01.labels();
% Select data for Video 1 and Channels 1-32 
s01_1 = squeeze(s01Data(1,1:32,:));
save('C:\\Users\\NYUAD\\Desktop\\CRB\\DEAP\\s01_1.mat', 's01_1');

% Import data into EEGLAB from Matlab variable
EEG = pop_importdata('dataformat','matlab','nbchan',32,'data',...
'C:\\Users\\NYUAD\\Desktop\\CRB\\DEAP\\s01_1.mat',...
'srate',128,'pnts',0,'xmin',0);