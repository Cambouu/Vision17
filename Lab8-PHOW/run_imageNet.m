conf.calDir = 'imageNet200/train' ;
dataDir = 'imageNet200/results2' ;
conf.autoDownloadData = false ;
conf.numTrain = 10 ;
conf.numTest = 10 ;
conf.numClasses = 200 ;
conf.numWords = 600 ;
conf.numSpatialX = [2 4] ;
conf.numSpatialY = [2 4] ;
conf.quantizer = 'kdtree' ; % 'vq'
conf.svm.C = 10 ; % Nivel de confianza
conf.svm.solver = 'sdca' ; %'sgd','liblinear'
conf.svm.biasMultiplier = 1 ;
conf.phowOpts = {'Step', 3} ;
conf.clobber = false ;
conf.tinyProblem = false ;
conf.prefix = 'baseline' ;
conf.randSeed = 1 ;
tam = 480;

% disp('Iniciando PHOW defecto');
% conf.dataDir = fullfile(dataDir,'default');
% mkdir(conf.dataDir);
% phow_imageNet(conf,tam);
% 
% disp('Iniciando PHOW numWords_500');
% conf.numWords = 500;
% conf.dataDir = fullfile(dataDir,'numWords_500');
% mkdir(conf.dataDir);
% phow_imageNet(conf,tam);
% 
% disp('Iniciando PHOW numWords_700');
% conf.numWords = 700;
% conf.dataDir = fullfile(dataDir,'numWords_700');
% mkdir(conf.dataDir);
% phow_imageNet(conf,tam);
% 
% disp('Iniciando PHOW smvC_01');
% conf.numWords = 600;
% conf.svm.C = 0.1;
% conf.dataDir = fullfile(dataDir,'smvC_01');
% mkdir(conf.dataDir);
% phow_imageNet(conf,tam);
% 
% disp('Iniciando PHOW smvC_100');
% conf.svm.C = 100;
% conf.dataDir = fullfile(dataDir,'smvC_100');
% mkdir(conf.dataDir);
% phow_imageNet(conf,tam);
% 
% disp('Iniciando PHOW tam_430');
% conf.svm.C = 10;
% tam=430;
% conf.dataDir = fullfile(dataDir,'tam_430');
% mkdir(conf.dataDir);
% phow_imageNet(conf,tam);
% 
% disp('Iniciando PHOW tam_530');
% tam=530;
% conf.dataDir = fullfile(dataDir,'tam_530');
% mkdir(conf.dataDir);
% phow_imageNet(conf,tam);

disp('Iniciando PHOW numSXY_2468');
tam=480;
conf.numSpatialX = [2 4 6 8] ;
conf.numSpatialY = [2 4 6 8] ;
conf.dataDir = fullfile(dataDir,'numSXY_2468');
mkdir(conf.dataDir);
phow_imageNet(conf,tam);

% disp('Iniciando PHOW numIm_25');
% conf.numSpatialX = [2 4] ;
% conf.numSpatialY = [2 4] ;
% conf.numTrain = 25 ;
% conf.numTest = 25 ;
% conf.dataDir = fullfile(dataDir,'numIm25');
% mkdir(conf.dataDir);
% phow_imageNet(conf,tam);