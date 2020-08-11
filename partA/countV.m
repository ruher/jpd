clear all;
tic;

cdir= pwd;
cd(cdir)

E={'0' '10' '20' '30' '40' '50' '60' '70' '80' '90' '100' '110' '120' '130' '140' '150' '160' '170' '180' '190' '200'};


V=zeros(length(E),100,61);
P1=zeros(length(E),100,61);
P2=zeros(length(E),100,61);
P=zeros(length(E),100,61);

for i=1:length(E)
%   for i=1  
    name=['PST_SL_tri_2D_inho_calo_erg_' E{i} 'field_tcycle'];
    dirname=[pwd '/' name(1:end-4) ];
    cd(dirname);
    
    for k=1:100;
        for kt=61:121 % 0~150 are initial states
            
            paraname=[dirname '/seed' num2str(k) '_t' num2str(kt) '.txt'];
            temp=load(paraname);
            
            XL=100;
            YL=40;
            %             xx=reshape(temp(:,1),XL,YL);
            %             yy=reshape(temp(:,2),XL,YL);
            P1_matrix=reshape(temp(:,3),XL,YL);
            P2_matrix=reshape(temp(:,4),XL,YL);
            [P1x,P1y]=gradient(P1_matrix);
            [P2x,P2y]=gradient(P2_matrix);
            C_S=P1x-P2y;
            
            foo1=mean(temp(:,3));
            P1(i,k,kt)=foo1;
            
            foo2=mean(temp(:,4));
            P2(i,k,kt)=foo2;
            
            foo12=sqrt(temp(:,3).^2+temp(:,4).^2);
            foo12m=max(max(foo12));
            P(i,k,kt)=foo12m;
            
            foo3=mean(mean(abs(C_S)));
            foo3m=max(max(abs(C_S)));
            
            ita=0.5;
            foo3c=max(foo3*ita+foo3m*(1-ita),1e-3);
            
            
            if foo12m<1e-3
                N=-2;
            else
                C_S_norm=logical(sign(abs(C_S)-foo3c)+1);
                C_S_norm(:,1:2)=0;
                C_S_norm(:,39:40)=0;
                [L,N]=bwlabel(C_S_norm,8);% NOT PERIODIC
                % imagesc(C_S);
            end
            
            if N==2
                if abs(foo1)>1e-2
                    N=0;
                end
            end
            
            V(i,k,kt)=round(N/2-0.1)*2;
        end
    end
    cd ../
end

toc;


% imagesc(sum((V==4),3))
% imagesc(sum((P1>1e-2),3))
% imagesc(sum((P2>1e-2),3))
% hist(reshape(V(1,1,:),1,100),-2:2:12)
% pcolor(reshape(V(1,1,:),10,10))
save('data.mat','V','P1','P2','P') 
exit
%system('ps -ef | grep mphserver | grep -v grep | awk ''{print $2}'' | xargs kill -9');
