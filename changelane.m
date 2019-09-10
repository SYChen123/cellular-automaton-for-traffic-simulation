function [result,direction] = changelane( new_map, pos, Pchange, dsafe, Vmax)
%��ͼ��ͬʱҪ�ģ�
%������ posΪ�˳�λ�� PchangeΪ������� dsafe����󳵱����ȫ����
%�����Ƿ���result���������direction��-1�� 1�ң����뵱ǰ����ǰ����ࣨʡ�ĺ������㣩
result = 0;
direction = 0;
i = pos(1);
j = pos(2);
frontcar1 = 0; %�뵱ǰ����ǰ������
frontcar2 = 0; %���Ա߳���ǰ������
backcar2 = 0; %���Ա߳����󳵾���
if Pchange ~= 0 %���ڵ��򳵵���·��������
    if rand() <= Pchange % ���б��
        if j==1 %�ڲ�ͬ�ĳ�����
           for k=i+1:size(new_map, 1) %�Ҵ˳��뵱ǰ����ǰ������
                if size(new_map{k,j},1)>1 % ����������г�
                    frontcar1 = k - i -1;
                    break;
                end
           end
           for k=i+1:size(new_map, 1) %�Ҵ˳����Ա߳���ǰ������
                if size(new_map{k,j+1},1)>1 % ����������г�
                    frontcar2 = k - i -1;
                    break;
                end
           end
           for k=i-1:-1:1 %�Ҵ˳����Ա߳����󳵾���
                if size(new_map{k,j+1},1)>1 % ����������г�
                    backcar2 = i - k -1;
                    break;
                end
           end
           if  frontcar1 < min(new_map{i,j}(2)+1, Vmax) && frontcar2 > frontcar1 && backcar2 > dsafe && size(new_map{i,j+1},1)==1  
               %���㻻�������Ͱ�ȫ���������Ա߳�����Ӧλ��û��
               result = 1;
               direction = 1;
           end
           
           
           
           
        elseif j==2
            for k=i+1:size(new_map, 1) %�Ҵ˳��뵱ǰ����ǰ������
                if size(new_map{k,j},1)>1 % ����������г�
                    frontcar1 = k - i -1;
                    break;
                end
            end
            for k=i+1:size(new_map, 1) %�Ҵ˳����Ա߳���ǰ������
                if size(new_map{k,j-1},1)>1 % ����������г�
                    frontcar2 = k - i -1;
                    break;
                end
            end
            for k=i-1:-1:1 %�Ҵ˳����Ա߳����󳵾���
                if size(new_map{k,j-1},1)>1 % ����������г�
                    backcar2 = i - k -1;
                    break;
                end
            end
           if  frontcar1 < min(new_map{i,j}(2)+1, Vmax) && frontcar2 > frontcar1 && backcar2 > dsafe && size(new_map{i,j-1},1)==1  
               %���㻻�������Ͱ�ȫ���������Ա߳�����Ӧλ��û��
               result = 1;
               direction = -1;
           end
           
           
           
        elseif j==4
            for k=i-1:-1:1 %�Ҵ˳��뵱ǰ����ǰ������
                if size(new_map{k,j},1)>1 % ����������г�
                    frontcar1 = i - k -1;
                    break;
                end
            end
            for k=i-1:-1:1 %�Ҵ˳����Ա߳���ǰ������
                if size(new_map{k,j+1},1)>1 % ����������г�
                    frontcar2 = i - k -1;
                    break;
                end
            end
            for k=i+1:size(new_map,1) %�Ҵ˳����Ա߳����󳵾���
                if size(new_map{k,j+1},1)>1 % ����������г�
                    backcar2 = k - i -1;
                    break;
                end
            end
            if  frontcar1 < min(new_map{i,j}(2)+1, Vmax) && frontcar2 > frontcar1 && backcar2 > dsafe && size(new_map{i,j+1},1)==1  
               %���㻻�������Ͱ�ȫ���������Ա߳�����Ӧλ��û��
               result = 1;
               direction = 1;
            end
            
            
            
            
        elseif j==5
            for k=i-1:-1:1 %�Ҵ˳��뵱ǰ����ǰ������
                if size(new_map{k,j},1)>1 % ����������г�
                    frontcar1 = i - k -1;
                    break;
                end
            end
            for k=i-1:-1:1 %�Ҵ˳����Ա߳���ǰ������
                if size(new_map{k,j-1},1)>1 % ����������г�
                    frontcar2 = i - k -1;
                    break;
                end
            end
            for k=i+1:size(new_map,1) %�Ҵ˳����Ա߳����󳵾���
                if size(new_map{k,j-1},1)>1 % ����������г�
                    backcar2 = k - i -1;
                    break;
                end
            end
            if  frontcar1 < min(new_map{i,j}(2)+1, Vmax) && frontcar2 > frontcar1 && backcar2 > dsafe && size(new_map{i,j-1},1)==1  
               %���㻻�������Ͱ�ȫ���������Ա߳�����Ӧλ��û��
               result = 1;
               direction = -1;
            end
            
            
            
            
        elseif j==406 %�ڲ�ͬ�ĳ�����
           for k=i+1:size(new_map, 1) %�Ҵ˳��뵱ǰ����ǰ������
                if size(new_map{k,j},1)>1 % ����������г�
                    frontcar1 = k - i -1;
                    break;
                end
           end
           for k=i+1:size(new_map, 1) %�Ҵ˳����Ա߳���ǰ������
                if size(new_map{k,j+1},1)>1 % ����������г�
                    frontcar2 = k - i -1;
                    break;
                end
           end
           for k=i-1:-1:1 %�Ҵ˳����Ա߳����󳵾���
                if size(new_map{k,j+1},1)>1 % ����������г�
                    backcar2 = i - k -1;
                    break;
                end
           end
           if  frontcar1 < min(new_map{i,j}(2)+1, Vmax) && frontcar2 > frontcar1 && backcar2 > dsafe && size(new_map{i,j+1},1)==1  
               %���㻻�������Ͱ�ȫ���������Ա߳�����Ӧλ��û��
               result = 1;
               direction = 1;
           end
           
           
           
           
        elseif j==407
            for k=i+1:size(new_map, 1) %�Ҵ˳��뵱ǰ����ǰ������
                if size(new_map{k,j},1)>1 % ����������г�
                    frontcar1 = k - i -1;
                    break;
                end
            end
            for k=i+1:size(new_map, 1) %�Ҵ˳����Ա߳���ǰ������
                if size(new_map{k,j-1},1)>1 % ����������г�
                    frontcar2 = k - i -1;
                    break;
                end
            end
            for k=i-1:-1:1 %�Ҵ˳����Ա߳����󳵾���
                if size(new_map{k,j-1},1)>1 % ����������г�
                    backcar2 = i - k -1;
                    break;
                end
            end
           if  frontcar1 < min(new_map{i,j}(2)+1, Vmax) && frontcar2 > frontcar1 && backcar2 > dsafe && size(new_map{i,j-1},1)==1  
               %���㻻�������Ͱ�ȫ���������Ա߳�����Ӧλ��û��
               result = 1;
               direction = -1;
           end
           
           
           
        elseif j==409
            for k=i-1:-1:1 %�Ҵ˳��뵱ǰ����ǰ������
                if size(new_map{k,j},1)>1 % ����������г�
                    frontcar1 = i - k -1;
                    break;
                end
            end
            for k=i-1:-1:1 %�Ҵ˳����Ա߳���ǰ������
                if size(new_map{k,j+1},1)>1 % ����������г�
                    frontcar2 = i - k -1;
                    break;
                end
            end
            for k=i+1:size(new_map,1) %�Ҵ˳����Ա߳����󳵾���
                if size(new_map{k,j+1},1)>1 % ����������г�
                    backcar2 = k - i -1;
                    break;
                end
            end
            if  frontcar1 < min(new_map{i,j}(2)+1, Vmax) && frontcar2 > frontcar1 && backcar2 > dsafe && size(new_map{i,j+1},1)==1  
               %���㻻�������Ͱ�ȫ���������Ա߳�����Ӧλ��û��
               result = 1;
               direction = 1;
            end
            
            
            
            
        elseif j==410
            for k=i-1:-1:1 %�Ҵ˳��뵱ǰ����ǰ������
                if size(new_map{k,j},1)>1 % ����������г�
                    frontcar1 = i - k -1;
                    break;
                end
            end
            for k=i-1:-1:1 %�Ҵ˳����Ա߳���ǰ������
                if size(new_map{k,j-1},1)>1 % ����������г�
                    frontcar2 = i - k -1;
                    break;
                end
            end
            for k=i+1:size(new_map,1) %�Ҵ˳����Ա߳����󳵾���
                if size(new_map{k,j-1},1)>1 % ����������г�
                    backcar2 = k - i -1;
                    break;
                end
            end
            if  frontcar1 < min(new_map{i,j}(2)+1, Vmax) && frontcar2 > frontcar1 && backcar2 > dsafe && size(new_map{i,j-1},1)==1  
               %���㻻�������Ͱ�ȫ���������Ա߳�����Ӧλ��û��
               result = 1;
               direction = -1;
            end
        end
    end
end
end

