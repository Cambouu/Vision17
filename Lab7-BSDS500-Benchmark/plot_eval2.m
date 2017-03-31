function plot_eval2(evalDir,evalDir2,evalDir3) %k-means, watershed, Pablo
% plot evaluation results.
% Pablo Arbelaez <arbelaez@eecs.berkeley.edu>
clc;
fprintf('\nk-means:\n');
% fwrite(2,sprintf('\n%s\n',evalDir));
col='b';
if exist(fullfile(evalDir,'eval_bdry_thr.txt'),'file'),
    open('isoF.fig');
    hold on
    prvals = dlmread(fullfile(evalDir,'eval_bdry_thr.txt')); % thresh,r,p,f
    f=find(prvals(:,2)>=0.01);
    prvals = prvals(f,:);

    evalRes = dlmread(fullfile(evalDir,'eval_bdry.txt'));
    if size(prvals,1)>1,
        plot(prvals(1:end,2),prvals(1:end,3),col,'LineWidth',3);
    else
        plot(evalRes(2),evalRes(3),'o','MarkerFaceColor',col,'MarkerEdgeColor',col,'MarkerSize',8);
    end
%     hold off

    fprintf('Boundary\n');
    fprintf('ODS: F( %1.2f, %1.2f ) = %1.2f   [th = %1.2f]\n',evalRes(2:4),evalRes(1));
    fprintf('OIS: F( %1.2f, %1.2f ) = %1.2f\n',evalRes(5:7));
    fprintf('Area_PR = %1.2f\n\n',evalRes(8));
end

if exist(fullfile(evalDir,'eval_cover.txt'),'file'),
    evalRes = dlmread(fullfile(evalDir,'eval_cover.txt'));
    fprintf('Region\n');
    fprintf('GT covering: ODS = %1.2f [th = %1.2f]. OIS = %1.2f. Best = %1.2f\n',evalRes(2),evalRes(1),evalRes(3:4));
    evalRes = dlmread(fullfile(evalDir,'eval_RI_VOI.txt'));
    fprintf('Rand Index: ODS = %1.2f [th = %1.2f]. OIS = %1.2f.\n',evalRes(2),evalRes(1),evalRes(3));
    fprintf('Var. Info.: ODS = %1.2f [th = %1.2f]. OIS = %1.2f.\n',evalRes(5),evalRes(4),evalRes(6));

end
%--------------------------------------------------------------------------
fprintf('\nwatershed:\n');
% fwrite(2,sprintf('\n%s\n',evalDir2));
col='y';
if exist(fullfile(evalDir2,'eval_bdry_thr.txt'),'file'),
%     open('isoF.fig');
%     hold on
    prvals = dlmread(fullfile(evalDir2,'eval_bdry_thr.txt')); % thresh,r,p,f
    f=find(prvals(:,2)>=0.01);
    prvals = prvals(f,:);

    evalRes = dlmread(fullfile(evalDir2,'eval_bdry.txt'));
    if size(prvals,1)>1,
        plot(prvals(1:end,2),prvals(1:end,3),col,'LineWidth',3);
    else
        plot(evalRes(2),evalRes(3),'o','MarkerFaceColor',col,'MarkerEdgeColor',col,'MarkerSize',8);
    end
%     hold off

    fprintf('Boundary\n');
    fprintf('ODS: F( %1.2f, %1.2f ) = %1.2f   [th = %1.2f]\n',evalRes(2:4),evalRes(1));
    fprintf('OIS: F( %1.2f, %1.2f ) = %1.2f\n',evalRes(5:7));
    fprintf('Area_PR = %1.2f\n\n',evalRes(8));
end

if exist(fullfile(evalDir2,'eval_cover.txt'),'file'),
    evalRes = dlmread(fullfile(evalDir2,'eval_cover.txt'));
    fprintf('Region\n');
    fprintf('GT covering: ODS = %1.2f [th = %1.2f]. OIS = %1.2f. Best = %1.2f\n',evalRes(2),evalRes(1),evalRes(3:4));
    evalRes = dlmread(fullfile(evalDir2,'eval_RI_VOI.txt'));
    fprintf('Rand Index: ODS = %1.2f [th = %1.2f]. OIS = %1.2f.\n',evalRes(2),evalRes(1),evalRes(3));
    fprintf('Var. Info.: ODS = %1.2f [th = %1.2f]. OIS = %1.2f.\n',evalRes(5),evalRes(4),evalRes(6));

end
%--------------------------------------------------------------------------
fprintf('\nPablo:\n');
% fwrite(2,sprintf('\n%s\n',evalDir3));
col='r';
if exist(fullfile(evalDir3,'eval_bdry_thr.txt'),'file'),
%     open('isoF.fig');
%     hold on
    prvals = dlmread(fullfile(evalDir3,'eval_bdry_thr.txt')); % thresh,r,p,f
    f=find(prvals(:,2)>=0.01);
    prvals = prvals(f,:);


    evalRes = dlmread(fullfile(evalDir3,'eval_bdry.txt'));
    if size(prvals,1)>1,
        plot(prvals(1:end,2),prvals(1:end,3),col,'LineWidth',3);
    else
        plot(evalRes(2),evalRes(3),'o','MarkerFaceColor',col,'MarkerEdgeColor',col,'MarkerSize',8);
    end
%     hold off

    fprintf('Boundary\n');
    fprintf('ODS: F( %1.2f, %1.2f ) = %1.2f   [th = %1.2f]\n',evalRes(2:4),evalRes(1));
    fprintf('OIS: F( %1.2f, %1.2f ) = %1.2f\n',evalRes(5:7));
    fprintf('Area_PR = %1.2f\n\n',evalRes(8));
end

if exist(fullfile(evalDir3,'eval_cover.txt'),'file'),
    evalRes = dlmread(fullfile(evalDir3,'eval_cover.txt'));
    fprintf('Region\n');
    fprintf('GT covering: ODS = %1.2f [th = %1.2f]. OIS = %1.2f. Best = %1.2f\n',evalRes(2),evalRes(1),evalRes(3:4));
    evalRes = dlmread(fullfile(evalDir3,'eval_RI_VOI.txt'));
    fprintf('Rand Index: ODS = %1.2f [th = %1.2f]. OIS = %1.2f.\n',evalRes(2),evalRes(1),evalRes(3));
    fprintf('Var. Info.: ODS = %1.2f [th = %1.2f]. OIS = %1.2f.\n',evalRes(5),evalRes(4),evalRes(6));

end
legend('','','k-means','watershed','Pablo');
hold off
end