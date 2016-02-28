%% Get deapData
PATH = 'T:\\CRB\\DEAP\\data\\';
deapData = makeDEAPstruct(PATH);

%Initialize EEG Var
% EEG = pop_importdata('dataformat','matlab',...
%     'nbchan',32,'data','T:\\CRB\\DEAP\\s01_1.mat',...
%     'srate',128,'subject','s1','pnts',0,'xmin',0,'session',[]);

%%
FS = 128;
BANDS = struct();
BANDS.freq = [
    [1 3] 
    [4 7]
    [8 13]
    [14 30]
    [31 50]
    ];

BANDS.names = {'delta' 'theta' 'alpha' 'beta' 'gamma'};

%% Get freq data

deapData.s1 = addFeaturesToSubject(deapData.s1, FS, BANDS);  