function new_pos = updatepos( pos, V )
%��ͼ��ͬʱҪ�ģ�
%λ�ø��� xΪ��ǰλ�� VΪ����ȷ�����ٶ�
i = pos(1);
j = pos(2);
if j==1||j==2||j==406||j==407 %��С���ܱߵĹ�·��
    i = i +V;
elseif j==4||j==5||j==409||j==410 
    i = i - V;
elseif (i==206||i==409) && j > 5 && j < 406 %��С���м��֧·��
    j = j - V;
elseif (i==208||i==411) && j > 5 && j < 406
    j = j + V;
end
new_pos = [i,j];
end

