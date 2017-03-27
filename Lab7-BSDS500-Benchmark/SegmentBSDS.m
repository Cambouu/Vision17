clear all, close all, clc
Path=fullfile('BSR','BSDS500','data','images');
% Path=fullfile('BSR','bench_fast','data','images');
mkdir('trainSegsKmeans');
mkdir('trainSegsWatershed');
mkdir('valSegsKmeans');
mkdir('valSegsWatershed');
K=[2,4,6,8,10];
DirTrain=dir(fullfile(Path,'train','*.jpg'));
DirVal=dir(fullfile(Path,'val','*.jpg'));
for i=1:length(DirTrain)
    im=imread(fullfile(Path,'train',DirTrain(i).name));
    SegsKmeans=cell(1,length(K));
    SegsWatershed=cell(1,length(K));
    for j=1:length(K)
        segkmeans=segmentByClustering(im,'hsv','k-means',K(j));
        segwatershed=segmentByClustering(im,'hsv','watershed',K(j));
        SegsKmeans{j}=segkmeans;
        SegsWatershed{j}=segwatershed;
    end
    save(sprintf('trainSegsKmeans/%s.mat',DirTrain(i).name(1:end-4)),'SegsKmeans');
    save(sprintf('trainSegsWatershed/%s.mat',DirTrain(i).name(1:end-4)),'SegsWatershed');
    fprintf('ImagenTrain %i de %i',i,length(DirTrain));
end
for i=1:length(DirVal)
    im=imread(fullfile(Path,'val',DirVal(i).name));
    SegsKmeans=cell(1,length(K));
    SegsWatershed=cell(1,length(K));
    for j=1:length(K)
        segkmeans=segmentByClustering(im,'hsv+xy','k-means',K(j));
        segwatershed=segmentByClustering(im,'hsv+xy','watershed',K(j));
        SegsKmeans{j}=segkmeans;
        SegsWatershed{j}=segwatershed;
    end
    save(sprintf('valSegsKmeans/%s.mat',DirVal(i).name(1:end-4)),'SegsKmeans');
    save(sprintf('valSegsWatershed/%s.mat',DirVal(i).name(1:end-4)),'SegsWatershed');
    fprintf('ImagenVal %i de %i',i,length(DirVal));
end