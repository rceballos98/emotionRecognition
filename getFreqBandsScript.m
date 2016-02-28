eeg_data = deapData.s7.v4.data.eeg;
Fs = 128;
bands = struct();
bands.freq = [
    [1 3] 
    [4 7]
    [8 13]
    [14 30]
    [31 50]
    ];

bands.names = {'delta' 'theta' 'alpha' 'beta' 'gamma'};

fb = freqBands(eeg_data(1:32,:),Fs,bands);

figure;
bar(fb.bands.med, 10*log10(fb.f.pb_tot))
set(gca, 'XTick', fb.bands.med, 'XTickLabel', fb.bands.names);





