function [CC_sort cluster_number Coef handle]=clusterV(Ps,Vs,Layer_index,Field_index)
% clc
% clear all;
test=reshape(Ps(Field_index,:,:),100,61);
testV=reshape(Vs(Field_index,:,:),100,61);
% plot the original figure
handle=Layer_index*100+Field_index;
figure(handle)
mycolormap=hsv(100);
TT=100:10:700;
subplot(121)
for ii=1:100
    plot(TT,test(ii,:)','Color',mycolormap(ii,:));
    hold on
end
hold off

% human clustering
prompt1='Please input number of branches\n';
cluster_number=input(prompt1);
if isempty(cluster_number)
    cluster_number=1;
end
% clutering
Y=pdist(test,'euclidean');
Z=linkage(Y,'complete');
Coef=cophenet(Z,Y);
T=cluster(Z,cluster_number);
% H=dendrogram(Z);
freq=zeros(cluster_number,1);
for ii=1:cluster_number
    freq(ii)=sum(T(:)==ii);
end
freq_sort=[freq(end); freq(1:end-1)];
Order=1:100;
label=[Order', T];
label_sort = sortrows(label,2);
cp_label_sort=[label_sort(end,:); label_sort(1:end-1,:)];
% shift and diffirentiate
flag=(label_sort(:,2)-cp_label_sort(:,2))~=0;
flags=[flag flag];
pickup=cp_label_sort(flags);
%verify
subplot(122)
mycolormap=hsv(cluster_number);
TT=100:10:700;
for ii=1:cluster_number
    plot(TT,test(pickup(ii),:)','Color',mycolormap(ii,:));
    hold on
end
hold off
figure(handle)
%export structure::vortex+number+data
AA=test((pickup(1:cluster_number)),:);
BB=testV((pickup(1:cluster_number)),:);
CC=[BB(:,1) freq_sort AA];
CC_sort = sortrows(CC,1);
end


