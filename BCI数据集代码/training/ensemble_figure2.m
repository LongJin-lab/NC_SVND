for i=1:5
	%�򿪵�fig�ļ������޸�·��
    hf(i)=open(['maintct',num2str(i),'.fig']);%��fig
    fig(i)=get(hf(i), 'CurrentAxes');         %��ȡ���Ƶ�ͼ��
end
figure
for i=1:4
	%��Ҫ���ƶ����ж���������ı�
    subplot(2,2,i);%��i����ͼ
    axChildren = get(fig(i),'Children');%��ȡ���Ƶ�ͼ��
    copyobj(axChildren, gca);%���Ƶ���ǰͼ����
    close(hf(i));%�ص��Ѿ����Ƶ�ͼ��
end
