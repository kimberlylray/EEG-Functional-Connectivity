%KLR - this will grab all .mat files created from HERMES Synchronization Liklihood and
%concatetante them into a single .mat 3D files to use in the NBS

clear all; 

DataDir = '/Users/PSYC-klr3342/Documents/MATLAB/HERMES Toolbox 2017-01-31/Output';

cd DataDir
load('Alpha_53760tp.mat', 'indexes')

files = dir(fullfile(DataDir,'*.mat'));
j=1
for i=1:76
    %making the ordering of this correspond to the exchange blocks and
    %contrast blocks previously created for Alpha
    j
    SL_All(:,:,j) = indexes.SL.data{1,i};
    j=j+1;
    SL_All(:,:,j) = indexes.SL.data{2,i};
    j=j+1
end
%%%%  save(fullfile(filepath,strcat(name,ext)),'signal');