for i = 1 : 6
    open(['maintct',num2str(i),'.fig']);
    h_line=get(gca,'Children');%get linehandles
    xdata(i,:)=get(h_line,'Xdata');
    ydata(i,:)=get(h_line,'Ydata');
    clear h_line
end 

y = ydata;
C = cool(5);
ydata = y;
figure;
plot(xdata(1,:),ydata(1,:),'LineStyle',":",'Color',[216,105,103]/255,'linewidth',1);
hold on
plot(xdata(1,:),ydata(2,:),'LineStyle',"-.",'Color',[88,83,159]/255,'linewidth',1);
hold on
plot(xdata(1,:),ydata(3,:),'LineStyle',"-.",'Color',[88,83,159]/255,'linewidth',1);
hold on
plot(xdata(1,:),ydata(4,:),'LineStyle',"-.",'Color',[88,83,159]/255,'linewidth',1);
hold on
plot(xdata(1,:),ydata(5,:),'LineStyle',"-.",'Color',[88,83,159]/255,'linewidth',1);
hold off

