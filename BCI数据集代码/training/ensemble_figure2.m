for i=1:5
	%打开的fig文件酌情修改路径
    hf(i)=open(['maintct',num2str(i),'.fig']);%打开fig
    fig(i)=get(hf(i), 'CurrentAxes');         %获取绘制的图像
end
figure
for i=1:4
	%看要绘制多少行多少列酌情改变
    subplot(2,2,i);%第i个子图
    axChildren = get(fig(i),'Children');%获取绘制的图像
    copyobj(axChildren, gca);%复制到当前图窗里
    close(hf(i));%关掉已经复制的图像
end
