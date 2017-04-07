% ConfDir=fullfile('imageNet200','BestResult');
% load(fullfile(ConfDir,'baseline-result.mat'));
% load(fullfile(ConfDir,'baseline-model.mat'));
MaxVal=max(diag(confus));
PosMax=find(diag(confus)==MaxVal);
disp('Las clases con mejor puntaje fueron:');
for i=1:length(PosMax)
    disp(model.classes{PosMax(i)})
end
MinVal=min(diag(confus));
PosMin=find(diag(confus)==MinVal);
disp('Las clases con peor puntaje fueron:');
for i=1:length(PosMin)
    disp(model.classes{PosMin(i)})
end