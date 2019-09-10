function [nm,counter] = insert_car(map, g, num1, id_counter, Vmax, S, car_pos)
%map地图 g是更新的行或列数 num1是车辆数 id_counter编号计数器 Vmax此路段限速 S是更新行还是列
new_map = map;
tmp = [0,1];
if strcmp(S,'column')==1
    for i=1:num1  
        id = id_counter;
        speed = randi(Vmax);
        tFlag = tmp(randi(2)); %车辆在小区门口转弯概率 0直行 1转弯
        car_info = [id;speed;tFlag];
        new_map{car_pos(i),g} = car_info;
        id_counter = id_counter+1;
    end
    
    nm = new_map(:, g);
elseif strcmp(S,'row')==1
    for i=1:num1  
        id = id_counter;
        speed = randi(Vmax);
        tFlag = tmp(randi(2)); %车辆在小区门口转弯概率 0直行 1转弯
        car_info = [id;speed;tFlag];
        new_map{g,car_pos(i)} = car_info;
        id_counter = id_counter+1;
    end
    nm = new_map(g,:);
end

counter = id_counter;

end

