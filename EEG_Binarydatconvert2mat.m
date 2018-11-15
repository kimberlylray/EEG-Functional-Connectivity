clear all; 

%%Data is stored on BoxSync
DataDir='/Users/PSYC-klr3342/Box Sync/R56Alpha/Alpha epoch export/';

files = dir(fullfile(DataDir, '*.dat'));

%%Opens EEGlab which seems to make the pop_fileio command work
%[ALLEEG EEG CURRENTSET ALLCOM] = '/Users/PSYC-klr3342/Documents/MATLAB/eeglab14_1_2b/eeglab';


for i=1:length(files)
    TempEEG = pop_fileio(fullfile(DataDir,files(i).name));
    %signal=TempEEG.data(:,:);
    %this takes only the first 90000 timepoints for Alpha
    signal=TempEEG.data(:,[1:90000]); 
    [filepath,name,ext] = fileparts(files(i).name);
    ext = '.mat';

    save(fullfile(filepath,strcat(name,ext)),'signal');
end
