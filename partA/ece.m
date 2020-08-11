clear all
clc

%------L1
load L1.mat
l1v2=composite([2,7,13,19,25,31,37,43,48],5:end);
l1v4=composite([3,8,14,21,27,32,38,44,50],5:end);
l1v6=composite([4,10,16,22,28,34,39,45,51],5:end);
l1v8=composite([5,11,17,23,29,35,41,46,52],5:end);
l1v10=composite([6,12,18,24,30,36,42],5:end);
L1=composite;

%------L2
load L2.mat
l2v2=composite([1,8,13,18,23,28,33,38,43,48,53,59,64,69,74],5:end);
l2v4=composite([3,9,14,19,24,29,34,39,44,54,60,65,70],5:end);
l2v6=composite([4,10,15,20,25,30,35,40,45,50,55,61,66,71],5:end);
l2v8=composite([5,11,16,21,26,31,36,41,46,56,62,67],5:end);
l2v10=composite([6,12,17,22,27,32,37,42,47,52,57],5:end);
L2=composite;

%------L3
load L3.mat
l3v4=composite([1,5,9,13,17,21,25,29,33,37,41,45,50,54,58,62,67,71,77],5:end);
l3v6=composite([2,6,10,14,18,22,26,30,34,38,42,46,51,55,59,63,68,72],5:end);
l3v8=composite([3,7,11,15,19,23,27,31,35,39,43,47,52,56,60,65],5:end);
l3v10=composite([4,8,12,16,20,24,28,32,36,40,44],5:end);
L3=composite;

%------L4
load L4.mat
l4v4=composite([1,7,12,17,22,29,34,39,44,49,54,59,65,72,78,84,89,94,100,107],5:end);
l4v6=composite([2,8,13,18,23,30,35,40,45,50,55,60,66,73,79,85,90,95,101,109],5:end);
l4v8=composite([3,9,14,19,24,31,36,41,46,51,56,61,67,75,81,86,92,97,104],5:end);
l4v10=composite([4,10,15,20,25,32,37,42,47,52,57],5:end);
l4v12=composite([5,11,16,21,26,33],5:end);
L4=composite;

% ------L5
load L5.mat
l5v4=composite([1,6,11,16,21,26,31,36,41,46,51,56,61,67,72,77,82,87,92,97],5:end);
l5v6=composite([2,7,12,17,22,27,32,37,42,47,52,57,62,68,73,78,83,88,93,98],5:end);
l5v8=composite([3,8,13,18,23,28,33,38,43,48,53,58,63,69,74,79,84,89,94,end],5:end);
l5v10=composite([4,9,14,19,24,29,34,39,44,49,54,59,64],5:end);
l5v12=composite([5,10,15,20,25],5:end);
L5=composite;

% ------L6
load L6.mat
l6v4=composite([1,5,9,13,17,21,25,29,33,37,41,45,49,53,57,61,65,69,73,77],5:end);
l6v6=composite([2,6,10,14,18,22,26,30,34,38,42,46,50,54,58,62,66,70,74,78],5:end);
l6v8=composite([3,7,11,15,19,23,27,31,35,39,43,47,51,55,59,63,67,71,75,79],5:end);
l6v10=composite([4,8,12,16,20,24,28,32,36,40,44,48,52],5:end);
L6=composite;


%------L5s2
load L5s2.mat
l5s2v4=composite([2,8,14,20,26,31,37,43,50,56,62,68,74,80,86,93,98,102,110],5:end);
l5s2v6=composite([3,9,15,21,27,32,38,44,51,57,63,69,75,81,87,94,99,103,107,111],5:end);
l5s2v8=composite([4,10,16,22,28,33,39,45,52,59,64,70,76,82,88,95,100,104,108,112],5:end);
l5s2v10=composite([5,11,17,23,29,34,40,46,53,60,66,71,78,83,90,96],5:end);
l5s2v12=composite([6,12,18,24,30,36,42,48,54],5:end);
l5s2=composite;

%------L5s3
load L5s3.mat
l5s3v4=composite([3,11,21,28,36,48,59,70,78,86,95,115,134,145,160,178,188,198,210,222],5:end);
l5s3v6=composite([5,14,22,30,42,54,62,73,81,88,98,118,138,149,162,181,191,202,213,223],5:end);
l5s3v8=composite([6,16,23,31,43,55,65,74,82,89,104,122,140,169,182,192,204,215,225],5:end);
l5s3v10=composite([7,17,24,32,44,56,66,76,83,90,105,123,141,152,170,183,193,205,216,end],5:end);
l5s3v12=composite([1,8,18,25,33,45,57,67,84,92,110,127,142,153,171,184:185,196,208,220],5:end);
l5s3=composite;

% ------
selected=l5v8;
FF=0:1:size(selected,1);
P_sum=zeros(length(FF),61);
P_sum(2:end,:)=selected*0.757;
% ------
TT=100:10:700;
TT_diff=105:10:695;
Vortex_index=2;
Layer_index=1;
% load P_sum
dy=diff(P_sum')/10;
dP_sum=dy';

handle=Vortex_index*10+Layer_index;
figure(handle)
 mycolormap=hsv(length(FF));

dT_sum=zeros(length(FF),length(TT_diff));

for jj=1:length(FF)
    dT_sum(jj,:)=trapz(dP_sum(1:jj,:))*-1;%P0
end

cp=calc_cp(5);
multiplier=TT_diff./cp';
M=repmat(multiplier,[size(selected,1)+1 1]);
dT_sum=dT_sum.*M;

 subplot(221)
for ii=1:length(FF)
    h1=subplot(221);
    plot(TT_diff,dT_sum(ii,:),'-*','Color',mycolormap(ii,:),'linewidth',1.5);
    xlabel('$\ {T}\ \mathbf{(K)}$','Interpreter','LaTex','fontsize',18);
    ylabel('$\ {\Delta T}\ \mathbf{(K)}$','Interpreter','LaTex','fontsize',18);
%     title(h3,'$\Delta T - T \ $','Interpreter','LaTex','fontsize',18);
    set(h1,'linewidth',2, 'box', 'on', 'FontSize',16,'Fontname', 'Times New Roman','XLim',[80 720],'XTick',100:100:700,'YLim',[-2 2],'YTick',-2:1:2);
    hold on
end

% ------
selected=l2v10;
FF=0:1:size(selected,1);%electric field
P_sum=zeros(length(FF),61);
P_sum(2:end,:)=selected*0.757;
% ------
TT=100:10:700;
TT_diff=105:10:695;
Vortex_index=2;
Layer_index=1;
% load P_sum
dy=diff(P_sum')/10;
dP_sum=dy';

handle=Vortex_index*10+Layer_index;
figure(handle)
 mycolormap=hsv(length(FF));

dT_sum=zeros(length(FF),length(TT_diff));

for jj=1:length(FF)
    dT_sum(jj,:)=trapz(dP_sum(1:jj,:))*-1;%P0
end

cp=calc_cp(5);
multiplier=TT_diff./cp';
M=repmat(multiplier,[size(selected,1)+1 1]);
dT_sum=dT_sum.*M;


 subplot(222)
for ii=1:length(FF)
    h2=subplot(222);
    plot(TT_diff,dT_sum(ii,:),'-*','Color',mycolormap(ii,:),'linewidth',1.5);
    xlabel('$\ {T}\ \mathbf{(K)}$','Interpreter','LaTex','fontsize',18);
    ylabel('$\ {\Delta T}\ \mathbf{(K)}$','Interpreter','LaTex','fontsize',18);
%     title(h3,'$\Delta T - T \ $','Interpreter','LaTex','fontsize',18);
    set(h2,'linewidth',2, 'box', 'on', 'FontSize',16,'Fontname', 'Times New Roman','XLim',[80 720],'XTick',100:100:700,'YLim',[-2 2],'YTick',-2:1:2);
    hold on
end

% ------
selected=l3v10;
FF=0:1:size(selected,1);%µç³¡
P_sum=zeros(length(FF),61);
P_sum(2:end,:)=selected*0.757;
% ------
TT=100:10:700;
TT_diff=105:10:695;
Vortex_index=2;
Layer_index=1;
% load P_sum
dy=diff(P_sum')/10;
dP_sum=dy';

handle=Vortex_index*10+Layer_index;
figure(handle)
 mycolormap=hsv(length(FF));

dT_sum=zeros(length(FF),length(TT_diff));

for jj=1:length(FF)
    dT_sum(jj,:)=trapz(dP_sum(1:jj,:))*-1;%P0
end

cp=calc_cp(5);
multiplier=TT_diff./cp';
M=repmat(multiplier,[size(selected,1)+1 1]);
dT_sum=dT_sum.*M;

 subplot(223)
for ii=1:length(FF)
    h3=subplot(223);
    plot(TT_diff,dT_sum(ii,:),'-*','Color',mycolormap(ii,:),'linewidth',1.5);
    xlabel('$\ {T}\ \mathbf{(K)}$','Interpreter','LaTex','fontsize',18);
    ylabel('$\ {\Delta T}\ \mathbf{(K)}$','Interpreter','LaTex','fontsize',18);
%     title(h3,'$\Delta T - T \ $','Interpreter','LaTex','fontsize',18);
    set(h3,'linewidth',2, 'box', 'on', 'FontSize',16,'Fontname', 'Times New Roman','XLim',[80 720],'XTick',100:100:700,'YLim',[-2 2],'YTick',-2:1:2);
    hold on
end

% ------
selected=l4v10;
FF=0:1:size(selected,1);
P_sum=zeros(length(FF),61);
P_sum(2:end,:)=selected*0.757;
% ------
TT=100:10:700;
TT_diff=105:10:695;
Vortex_index=2;
Layer_index=1;
% load P_sum
dy=diff(P_sum')/10;
dP_sum=dy';

handle=Vortex_index*10+Layer_index;
figure(handle)
 mycolormap=hsv(length(FF));

dT_sum=zeros(length(FF),length(TT_diff));

for jj=1:length(FF)
    dT_sum(jj,:)=trapz(dP_sum(1:jj,:))*-1*1*TT_diff(jj)/3.9;%P0*T/Ce
end

 subplot(224)
for ii=1:length(FF)
    h4=subplot(224);
    plot(TT_diff,dT_sum(ii,:),'-*','Color',mycolormap(ii,:),'linewidth',1.5);
    xlabel('$\ {T}\ \mathbf{(K)}$','Interpreter','LaTex','fontsize',18);
    ylabel('$\ {\Delta T}\ \mathbf{(K)}$','Interpreter','LaTex','fontsize',18);
%     title(h3,'$\Delta T - T \ $','Interpreter','LaTex','fontsize',18);
    set(h4,'linewidth',2, 'box', 'on', 'FontSize',16,'Fontname', 'Times New Roman','XLim',[80 720],'XTick',100:100:700,'YLim',[-2 2],'YTick',-2:1:2);
    hold on
end



hold off
% 
% dirname=[pwd '\plots'  ];
% if ~exist(dirname,'dir')
%     mkdir(dirname);
% end
% fig_name=[dirname '\V'  num2str(Vortex_index) '_L' num2str(Layer_index) 'fine.jpg'];
% export_fig(fig_name,'-jpg','-transparent','-r','300');
% hold off
% close(handle)
