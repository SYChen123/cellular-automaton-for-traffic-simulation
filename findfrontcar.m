function frontcar = findfrontcar( new_map, pos )
%��ͼ��ͬʱҪ�ģ�
%�ҵ���ǰ������ǰ��
i = pos(1);
j = pos(2);
frontcar = 1000;
if j==1 %�ڲ�ͬ�ĳ�����
   for k=i+1:size(new_map, 1) %�Ҵ˳��뵱ǰ����ǰ������
        if size(new_map{k,j},1)>1 % ����������г�
            frontcar = k - i -1;
            break;
        end
   end
   
elseif j==2
    for k=i+1:size(new_map, 1) %�Ҵ˳��뵱ǰ����ǰ������
        if size(new_map{k,j},1)>1 % ����������г�
            frontcar = k - i -1;
            break;
        end
    end
   
elseif j==4
    for k=i-1:-1:1 %�Ҵ˳��뵱ǰ����ǰ������
        if size(new_map{k,j},1)>1 % ����������г�
            frontcar = i - k -1;
            break;
        end
    end
    
elseif j==5
    for k=i-1:-1:1 %�Ҵ˳��뵱ǰ����ǰ������
        if size(new_map{k,j},1)>1 % ����������г�
            frontcar = i - k -1;
            break;
        end
    end
    
elseif j==406 %�ڲ�ͬ�ĳ�����
   for k=i+1:size(new_map, 1) %�Ҵ˳��뵱ǰ����ǰ������
        if size(new_map{k,j},1)>1 % ����������г�
            frontcar = k - i -1;
            break;
        end
   end

elseif j==407
    for k=i+1:size(new_map, 1) %�Ҵ˳��뵱ǰ����ǰ������
        if size(new_map{k,j},1)>1 % ����������г�
            frontcar = k - i -1;
            break;
        end
    end
    
elseif j==409
    for k=i-1:-1:1 %�Ҵ˳��뵱ǰ����ǰ������
        if size(new_map{k,j},1)>1 % ����������г�
            frontcar = i - k -1;
            break;
        end
    end
    
elseif j==410
    for k=i-1:-1:1 %�Ҵ˳��뵱ǰ����ǰ������
        if size(new_map{k,j},1)>1 % ����������г�
            frontcar = i - k -1;
            break;
        end
    end
    
end
end

