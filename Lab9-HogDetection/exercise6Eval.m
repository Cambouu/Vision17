clear all, close all, clc, fclose('all'); dbstop if error, tic
setup;
load('VarTrain.mat');
DirClass=fullfile('..','lab9Detection','WIDER_val');
namesClass=dir(DirClass); namess={};
mkdir(fullfile('..','Results'));
parfor i=3:length(namesClass)
    DirIm=dir(fullfile(DirClass,namesClass(i).name,'*.jpg'));
    mkdir(fullfile('..','Results',namesClass(i).name));
    for j=1:length(DirIm)
        fprintf('Folder: %i de %i. Imagen: %i de %i\n',...
            i,length(namesClass),j,length(DirIm));
        ImPath=fullfile(DirClass,namesClass(i).name,DirIm(j).name);
        im = imread(ImPath) ;
        im = im2single(im) ;
        
        % Compute detections
        [detections, scores] = detect(im, w, hogCellSize, scales) ;
        keep = boxsuppress(detections, scores, 0.25) ;
        detections = detections(:, keep(1:10)) ;
        scores = scores(keep(1:10)) ;
        
        DirResult=fullfile('..','Results',namesClass(i).name,DirIm(j).name);
        fil=fopen(strcat(DirResult(1:end-4),'.txt'),'w');
        fprintf(fil,'%s\n%i\n',DirIm(j).name,length(scores));
        for s=1:length(scores)
            if s==length(scores)
                pattern='%i %i %i %i %f';
            else
                pattern='%i %i %i %i %f\n';
            end
            fprintf(fil,pattern,...
                round(detections(1,s)),round(detections(2,s)),...
                round(detections(3,s)-detections(1,s)),...
                round(detections(4,s)-detections(2,s)),scores(s));
        end
        fclose(fil);
    end
end
toc
