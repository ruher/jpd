flag = 0;
if flag==1
    x5uc4v=load('5uc4v.txt','ascii');
    P1=x5uc4v(:,3);
    P2=x5uc4v(:,4);
    P1r=reshape(P1,400,68);
    P2r=reshape(P2,400,68);
    P1ry1=P1r(:,[68 1:67]);
    P1ry2=P1r(:,[2:68 1]);
    P2rx1=P2r([400 1:399],:);
    P2rx2=P2r([2:400 1],:);
    P1y1=P1r-P1ry1;
    P2x1=P2r-P2rx1;
    CS1=abs(P1y1-P2x1);
    
    P1y2=P1r-P1ry2;
    P2x2=P2r-P2rx2;
    CS2=abs(P1y2-P2x2);
    
    CS=(CS1+CS2)/2*10;
    temp=reshape(CS,27200,1);
    data=[x5uc4v(:,1:2) temp];
    save('cal5uc4v.txt', 'data', '-ascii');
end


emblem=1;
if emblem==1
    
    data=load('cal5uc10v.txt','-ascii');
    CS=reshape(data(:,3),400,68);
    
    h=surf(reshape(data(:,1),400,68),reshape(data(:,2),400,68),CS);
    set(gcf,'Position',[1 1 1600 900],'Color',[1 1 1]);
    axis equal
    shading flat
    axis([-20 20 -4 4 0 3])
    set(gca,'XTick',-20:5:20,'YTick',-4:2:4, 'zTick',0:1:3,'FontSize',30,'Fontname', 'Times New Roman')
    view(3)
     export_fig(datestr(now, 'yyyymmddHHMMSS'),'-jpg','-transparent','-r','300');
end

%-----------
fig1=0;

if fig1==1
figure(1)
data=load('cal5uc4v.txt','-ascii');
plot(data(13601:14000,1),data(13601:14000,3),'c-+','LineWidth',2,'MarkerSize',10);
hold on
foo=data(13601:14000,3);

data=load('cal5uc6v.txt','-ascii');
plot(data(13601:14000,1),data(13601:14000,3),'m-*','LineWidth',2,'MarkerSize',10);
hold on
foo=[foo data(13601:14000,3)];

data=load('cal5uc8v.txt','-ascii');
plot(data(13601:14000,1),data(13601:14000,3),'y-o','LineWidth',2,'MarkerSize',10);
hold on
foo=[foo data(13601:14000,3)];

% data=load('cal5uc10v.txt','-ascii');
% plot(data(13601:14000,1),data(13601:14000,3),'k-x','LineWidth',2,'MarkerSize',10);
% hold off
% foo=[foo data(13601:14000,3)];

test10v=0;
data=load('cal5uc10v.txt','-ascii');
xxt=reshape(data(:,1),400,68);
yyt=reshape(data(:,3),400,68);
start=28;

if test10v==1
    mycolormap=hsv(10);
    for kk=1:10
        xx=xxt(:,start+kk-1);
        yy=yyt(:,start+kk-1);
        plot(xx,yy,'-+','Color',mycolormap(kk,:));
        hold on
    end
end
if test10v==0
    xx=xxt(:,start);
    yy=yyt(:,start);
    plot(xx,yy,'k-x','LineWidth',2,'MarkerSize',10);
    hold on
    foo=[foo yyt(:,start)];
end

axis([-20 20 -0.2 3])
set(gca,'XTick',-20:5:20,'YTick',0:1:3, 'FontSize',20,'Fontname', 'Times New Roman')
export_fig(datestr(now, 'yyyymmddHHMMSS'),'-jpg','-transparent','-r','300');
end
%-----------
fig2=0;

if fig2==1
    
figure(2)

test4v=0;
data=load('cal5uc4v.txt','-ascii');
xxt=reshape(data(:,2),400,68);
yyt=reshape(data(:,3),400,68);
start=146;

if test4v==1
    mycolormap=hsv(10);
    for kk=1:10
        xx=xxt(start+kk-1,:);
        yy=yyt(start+kk-1,:);
        plot(xx,yy,'-+','Color',mycolormap(kk,:));
        hold on
    end
end
if test4v==0
    xx=xxt(start,:);
    yy=yyt(start,:);
    plot(xx,yy,'c-+','LineWidth',2,'MarkerSize',10);
    hold on
    foo=yyt(start,:);
end

test6v=0;
data=load('cal5uc6v.txt','-ascii');
xxt=reshape(data(:,2),400,68);
yyt=reshape(data(:,3),400,68);
start=111;

if test6v==1
    mycolormap=hsv(10);
    for kk=1:10
        xx=xxt(start+kk-1,:);
        yy=yyt(start+kk-1,:);
        plot(xx,yy,'-*','Color',mycolormap(kk,:));
        hold on
    end
end
if test6v==0
    xx=xxt(start,:);
    yy=yyt(start,:);
    plot(xx,yy,'m-*','LineWidth',2,'MarkerSize',10);
    hold on
        foo=[foo; yyt(start,:)];
end

test8v=0;
data=load('cal5uc8v.txt','-ascii');
xxt=reshape(data(:,2),400,68);
yyt=reshape(data(:,3),400,68);
start=123;

if test8v==1
    mycolormap=hsv(10);
    for kk=1:10
        xx=xxt(start+kk-1,:);
        yy=yyt(start+kk-1,:);
        plot(xx,yy,'-*','Color',mycolormap(kk,:));
        hold on
    end
end
if test8v==0
    xx=xxt(start,:);
    yy=yyt(start,:);
    plot(xx,yy,'y-o','LineWidth',2,'MarkerSize',10);
    hold on
      foo=[foo; yyt(start,:)];
end

test10v=0;
data=load('cal5uc10v.txt','-ascii');
xxt=reshape(data(:,2),400,68);
yyt=reshape(data(:,3),400,68);
start=55;

if test10v==1
    mycolormap=hsv(10);
    for kk=1:10
        xx=xxt(start+kk-1,:);
        yy=yyt(start+kk-1,:);
        plot(xx,yy,'-*','Color',mycolormap(kk,:));
        hold on
    end
end
if test10v==0
    xx=xxt(start,:);
    yy=yyt(start,:);
    plot(xx,yy,'k-x','LineWidth',2,'MarkerSize',10);
    hold off
      foo=[foo; yyt(start,:)];
end
axis equal
axis([-4 4 -0.2 3])
set(gca,'XTick',-3:1:3,'YTick',0:1:3, 'FontSize',20,'Fontname', 'Times New Roman')
% export_fig(datestr(now, 'yyyymmddHHMMSS'),'-jpg','-transparent','-r','300');

end