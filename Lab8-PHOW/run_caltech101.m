conf.calDir = 'data/caltech-101/101_ObjectCategories' ;
dataDir = 'data/' ;
conf.autoDownloadData = false ;
conf.numTrain = 15 ;
conf.numTest = 15 ;
conf.numClasses = 102 ;
conf.numWords = 600 ;
conf.numSpatialX = [2 4] ;
conf.numSpatialY = [2 4] ;
conf.quantizer = 'kdtree' ;
conf.svm.C = 10 ;
conf.svm.solver = 'sdca' ; % 'sgd','liblinear'
conf.svm.biasMultiplier = 1 ;
conf.phowOpts = {'Step', 3} ;
conf.clobber = false ;
conf.tinyProblem = true ;
conf.prefix = 'baseline' ;
conf.randSeed = 1 ;
tam=480;

disp('Iniciando PHOW defecto');
conf.dataDir = fullfile(dataDir,'default');
mkdir(conf.dataDir);
phow_caltech101(conf,tam);

% disp('Iniciando PHOW numWords_500');
% conf.numWords = 500;
% conf.dataDir = fullfile(dataDir,'numWords_500');
% mkdir(conf.dataDir);
% phow_caltech101(conf,tam);
% 
% disp('Iniciando PHOW numWords_700');
% conf.numWords = 700;
% conf.dataDir = fullfile(dataDir,'numWords_700');
% mkdir(conf.dataDir);
% phow_caltech101(conf,tam);
% 
% disp('Iniciando PHOW smvC_01');
% conf.numWords = 600;
% conf.svm.C = 0.1;
% conf.dataDir = fullfile(dataDir,'smvC_01');
% mkdir(conf.dataDir);
% phow_caltech101(conf,tam);
% 
% disp('Iniciando PHOW smvC_100');
% conf.svm.C = 100;
% conf.dataDir = fullfile(dataDir,'smvC100');
% mkdir(conf.dataDir);
% phow_caltech101(conf,tam);
% 
% disp('Iniciando PHOW tam_430');
% conf.svm.C = 10;
% tam=430;
% conf.dataDir = fullfile(dataDir,'tam_430');
% mkdir(conf.dataDir);
% phow_caltech101(conf,tam);
% 
% disp('Iniciando PHOW tam_530');
% tam=530;
% conf.dataDir = fullfile(dataDir,'tam_530');
% mkdir(conf.dataDir);
% phow_caltech101(conf,tam);
% 
% disp('Iniciando PHOW numSX_46816');
% tam=480;
% conf.numSpatialX = [2 4 8 16] ;
% conf.dataDir = fullfile(dataDir,'numSX_46816');
% mkdir(conf.dataDir);
% phow_caltech101(conf,tam);
% 
% disp('Iniciando PHOW numSY_46816');
% conf.numSpatialX = [2 4] ;
% conf.numSpatialY = [2 4 8 16] ;
% conf.dataDir = fullfile(dataDir,'numSY_46816');
% mkdir(conf.dataDir);
% phow_caltech101(conf,tam);
% 
% disp('Iniciando PHOW numIm_25');
% conf.numSpatialY = [2 4] ;
% conf.numTrain = 25 ;
% conf.numTest = 25 ;
% conf.dataDir = fullfile(dataDir,'numIm25');
% mkdir(conf.dataDir);
% phow_caltech101(conf,tam);