clear all; 

DataDir='/Users/PSYC-klr3342/Documents/EEG_connectivity/Alpha39/';
%DataDir='/Users/PSYC-klr3342/Documents/EEG_connectivity/Alpha41/';
%DataDir='/Users/PSYC-klr3342/Documents/EEG_connectivity/Beta39/';

files = dir(fullfile(DataDir, '*.dat'));
for i=1:length(files)
    Temp = importdata(fullfile(DataDir,files(i).name));
    %we only want these rows which correspond to the Biosemi head
    %signal=Temp.data([5:68],:); %this is for all timepoints
    signal=Temp.data([1:64],[1:53760]); %this takes only the frist 53760 timepoints for Alpha39
    [filepath,name,ext] = fileparts(files(i).name);
    ext = '.mat';

    save(fullfile(filepath,strcat(name,ext)),'signal');
end
