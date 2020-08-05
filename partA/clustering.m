clc
clear all;
Layer_index=666;
load 6uc.mat
Vs=V(:,:,61:end);
Ps=P2(:,:,61:end);
composite=[];
Field_index=1; %initial
while Field_index<21
    Field_index=Field_index+1;
    ok=0;
    while ok==0
    [temp cluster_number Coef handle]=clusterV(Ps,Vs,Layer_index,Field_index);
    suffix1=ones(cluster_number,1)*(Field_index-1);
    suffix2=ones(cluster_number,1)*Coef;
    disp(temp(:,1:2))
    % human clustering
    prompt1='Please verify the input number of branches\n';
    ok=input(prompt1);
    if isempty(ok)
        ok=0;
    end
    end
    composite=[composite;[suffix1 suffix2 temp]];
    close(handle)
end

% file_name=[pwd '\L' num2str(Layer_index) '.mat'];
% save(file_name, 'composite')
