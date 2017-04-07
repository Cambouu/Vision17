function ACAresults
dirResult='results';
DirRes=dir(dirResult);
DirRes=DirRes([DirRes.isdir]);
DirRes=DirRes(3:end);
for i=1:length(DirRes)
    load(fullfile(dirResult,DirRes(i).name,'baseline-result.mat'));
    ACA=100*mean(diag(confus)/conf.numTest);
    fprintf('ACA de %s: %f%%\n',DirRes(i).name,ACA);
end
end