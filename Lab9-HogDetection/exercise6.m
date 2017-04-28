% EXERCISE5
setup ;
close all, clear all, clc, dbstop if error
tic,
%%
% Training cofiguration
targetClass = 1 ;
numHardNegativeMiningIterations = 5 ;
schedule = [1 2 5 5 5] ;

% Scale space configuration
hogCellSize = 8 ;
minScale = -1 ;
maxScale = 3 ;
numOctaveSubdivisions = 3 ;
scales = 2.^linspace(...
    minScale,...
    maxScale,...
    numOctaveSubdivisions*(maxScale-minScale+1)) ;

% -------------------------------------------------------------------------
% Step 5.1: Construct custom training data
% -------------------------------------------------------------------------
disp('Construyendo matriz de imagenes');
% Load object examples
trainImages = {} ;
trainBoxes = [] ;
trainBoxPatches = {} ;
trainBoxImages = {} ;
trainBoxLabels = [] ;

% Construct negative data
names = dir('../lab9Detection/BACKGROUND_Google') ;
names=names(3:end);
trainImages = fullfile('..', 'lab9Detection','BACKGROUND_Google',{names.name}) ;
numTrainNeg=numel(trainImages);
trainImages=randsample(trainImages,numTrainNeg);

% Construct positive data
names = dir('../lab9Detection/TrainCrops');
namess={};
for i=3:length(names)
    Dir=dir(fullfile('..','lab9Detection','TrainCrops',names(i).name,'*.jpg'));
    for j=1:length(Dir)
        namess=cat(1,namess,fullfile(...
            '..','lab9Detection','TrainCrops',names(i).name,Dir(j).name));
    end
end
names = namess;
numTrainPos=numTrainNeg*2;
names=randsample(names,numTrainPos);
trainBoxes=zeros(4,numTrainPos);
trainBoxPatches=cell(1,numTrainPos);
trainBoxImages=cell(1,numTrainPos);
trainBoxLabels=zeros(1,numTrainPos);
for i=1:numel(names)
    im = imread(names{i}) ;
    im = imresize(im, [64 64]) ;
    trainBoxes(:,i) = [0.5 ; 0.5 ; 64.5 ; 64.5] ;
    trainBoxPatches{i} = im2single(im) ;
    trainBoxImages{i} = names{i} ;
    trainBoxLabels(i) = 1 ;
end
trainBoxPatches = cat(4, trainBoxPatches{:});

disp('Computando HOG');
% Compute HOG features of examples (see Step 1.2)
trainBoxHog = {} ;
for i = 1:size(trainBoxPatches,4)
    trainBoxHog{i} = vl_hog(trainBoxPatches(:,:,:,i), hogCellSize) ;
end
trainBoxHog = cat(4, trainBoxHog{:}) ;
modelWidth = size(trainBoxHog,2) ;
modelHeight = size(trainBoxHog,1) ;

% -------------------------------------------------------------------------
% Step 5.2: Visualize the training images
% -------------------------------------------------------------------------

figure(1) ; clf ;

subplot(1,2,1) ;
imagesc(vl_imarraysc(trainBoxPatches)) ;
axis off ;
title('Training images (positive samples)') ;
axis equal ;

subplot(1,2,2) ;
imagesc(mean(trainBoxPatches,4)) ;
box off ;
title('Average') ;
axis equal ;

% -------------------------------------------------------------------------
% Step 5.3: Train with hard negative mining
% -------------------------------------------------------------------------

% Initial positive and negative data
pos = trainBoxHog(:,:,:,ismember(trainBoxLabels,targetClass)) ;
neg = zeros(size(pos,1),size(pos,2),size(pos,3),0) ;

disp('Starting Hard Negative Mining');
for t=1:numHardNegativeMiningIterations
    
    numPos = size(pos,4) ;
    numNeg = size(neg,4) ;
    C = 1 ;
    lambda = 1 / (C * (numPos + numNeg)) ;
    
    fprintf('Hard negative mining iteration %d: pos %d, neg %d\n', ...
        t, numPos, numNeg) ;
    
    % Train an SVM model (see Step 2.2)
    x = cat(4, pos, neg) ;
    x = reshape(x, [], numPos + numNeg) ;
    y = [ones(1, size(pos,4)) -ones(1, size(neg,4))] ;
    w = vl_svmtrain(x,y,lambda,'epsilon',0.01,'verbose') ;
    w = single(reshape(w, modelHeight, modelWidth, [])) ;
    
    % Plot model
    figure(2) ; clf ;
    imagesc(vl_hog('render', w)) ;
    colormap gray ;
    axis equal ;
    title('SVM HOG model') ;
    
    % Evaluate on training data and mine hard negatives
    figure(3) ;
    [matches, moreNeg] = ...
        evaluateModel(...
        vl_colsubset(trainImages', schedule(t), 'beginning'), ...
        trainBoxes, trainBoxImages, ...
        w, hogCellSize, scales) ;
    
    % Add negatives
    neg = cat(4, neg, moreNeg) ;
    
    % Remove negative duplicates
    z = reshape(neg, [], size(neg,4)) ;
    [~,keep] = unique(z','stable','rows') ;
    neg = neg(:,:,:,keep) ;
end


% -------------------------------------------------------------------------
% Step 5.3: Evaluate the model on the test data
% -------------------------------------------------------------------------
beep; save('VarTrain.mat','w','hogCellSize','scales'); toc