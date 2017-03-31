%% Examples of benchmarks for different input formats
addpath(fullfile('BSR','bench_fast','benchmarks'));
clear all;close all;clc;

%% Morphological version for : all the benchmarks for results stored as a cell of segmentations
set='train';
imgDir=fullfile('BSR','BSDS500','data','images',set);
gtDir=fullfile('BSR','BSDS500','data','groundTruth',set);

inDir=sprintf('%sSegsKmeans2',set);
outDir=sprintf('eval/%sKmeans',set);
mkdir(outDir);
nthresh = 99;
tic;
allBench_fast(imgDir, gtDir, inDir, outDir, nthresh);
toc

inDir=sprintf('%sSegsWatershed2',set);
outDir=sprintf('eval/%sWatershed',set);
mkdir(outDir);
tic;
allBench_fast(imgDir, gtDir, inDir, outDir, nthresh);
toc