%% Get deapData
PATH = 'T:\\CRB\\DEAP\\data\\';
deapData.data = makeDEAPstruct(PATH);

%Initialize EEG Var
% EEG = pop_importdata('dataformat','matlab',...
%     'nbchan',32,'data','T:\\CRB\\DEAP\\s01_1.mat',...
%     'srate',128,'subject','s1','pnts',0,'xmin',0,'session',[]);

%% Recording Data
% Frequency
deapData.info.fs = 128;

% Eletrode Mapping
deapData.info.mapping = getElectrodeMapping();


%% Analysis Data
% Frequency Bands of interest
BANDS = struct();
BANDS.freq = [
    [1 3] 
    [4 7]
    [8 13]
    [14 30]
    [31 50]
    ];

BANDS.names = {'delta' 'theta' 'alpha' 'beta' 'gamma'};
deapData.info.bands = BANDS;

%% Add features to DEAP struct
%%deapData.data.s1 = addFeaturesToSubject(deapData.data.s1, deapData.info); 

%% Make new feature struct
featureData = makeFeatureStruct(deapData);