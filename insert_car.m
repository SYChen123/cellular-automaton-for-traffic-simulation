function [nm,counter] = insert_car(map, g, num1, id_counter, Vmax, S, car_pos)
%map��ͼ g�Ǹ��µ��л����� num1�ǳ����� id_counter��ż����� Vmax��·������ S�Ǹ����л�����
new_map = map;
tmp = [0,1];
if strcmp(S,'column')==1
    for i=1:num1  
        id = id_counter;
        speed = randi(Vmax);
        tFlag = tmp(randi(2)); %������С���ſ�ת����� 0ֱ�� 1ת��
        car_info = [id;speed;tFlag];
        new_map{car_pos(i),g} = car_info;
        id_counter = id_counter+1;
    end
    
    nm = new_map(:, g);
elseif strcmp(S,'row')==1
    for i=1:num1  
        id = id_counter;
        speed = randi(Vmax);
        tFlag = tmp(randi(2)); %������С���ſ�ת����� 0ֱ�� 1ת��
        car_info = [id;speed;tFlag];
        new_map{g,car_pos(i)} = car_info;
        id_counter = id_counter+1;
    end
    nm = new_map(g,:);
end

counter = id_counter;

end

