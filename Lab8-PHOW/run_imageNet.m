conf.calDir = 'imageNet200/train' ;
dataDir = 'imageNet200/results' ;
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

disp('Iniciando PHOW defecto');
conf.dataDir = fullfile(dataDir,'default');
mkdir(conf.dataDir);
phow_imageNet(conf,tam);
conf.numWords = 500;
disp('Iniciando PHOW numWords_500');
conf.dataDir = fullfile(dataDir,'numWords_500');
mkdir(conf.dataDir);
phow_imageNet(conf,tam);
conf.numWords = 700;
disp('Iniciando PHOW numWords_700');
conf.dataDir = fullfile(dataDir,'numWords_700');
mkdir(conf.dataDir);
phow_imageNet(conf,tam);
conf.svm.C = 5;
disp('Iniciando PHOW smvC_5');
conf.dataDir = fullfile(dataDir,'smvC_5');
mkdir(conf.dataDir);
phow_imageNet(conf,tam);
conf.svm.C = 15;
disp('Iniciando PHOW smvC_15');
conf.dataDir = fullfile(dataDir,'smvC_15');
mkdir(conf.dataDir);
phow_imageNet(conf,tam);