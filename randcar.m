function new_map = randcar( map, num1,num2 )
%�����ʼ�������ڵ�ͼ�е�λ�ú��ٶ�
% map��ͼ num1����·�ϵĳ����� num2����С����֧·�ϳ�����
new_map = map;
car_pos = randi(size(map,1),num1,1);
id_counter = 3; % ������ż�����

[new_map(:,1), id_counter] = insert_car(map, 1, num1, id_counter, 20, 'column',car_pos);
car_pos = randi(size(map,1),num1,1);
[new_map(:,2), id_counter] = insert_car(map, 2, num1, id_counter, 20, 'column',car_pos);
car_pos = randi(size(map,1),num1,1);
[new_map(:,4), id_counter] = insert_car(map, 4, num1, id_counter, 20, 'column',car_pos);
car_pos = randi(size(map,1),num1,1);
[new_map(:,5), id_counter] = insert_car(map, 5, num1, id_counter, 20, 'column',car_pos);
car_pos = randi(size(map,1),num1,1);
[new_map(:,end), id_counter] = insert_car(map, size(new_map,2), num1, id_counter, 20, 'column',car_pos);
car_pos = randi(size(map,1),num1,1);
[new_map(:,end-1), id_counter] = insert_car(map, size(new_map,2)-1, num1, id_counter, 20, 'column',car_pos);
car_pos = randi(size(map,1),num1,1);
[new_map(:,end-3), id_counter] = insert_car(map, size(new_map,2)-3, num1, id_counter, 20, 'column',car_pos);
car_pos = randi(size(map,1),num1,1);
[new_map(:,end-4), id_counter] = insert_car(map, size(new_map,2)-4, num1, id_counter, 20, 'column',car_pos);

car_pos = randi(size(map,2),num1,1);
[new_map(206,:), id_counter] = insert_car(map, 206, num2, id_counter, 10, 'row',car_pos);
[new_map(208,:), id_counter] = insert_car(map, 208, num2, id_counter, 10, 'row',car_pos);
car_pos = randi(size(map,2),num1,1);
[new_map(409,:), id_counter] = insert_car(map, 409, num2, id_counter, 10, 'row',car_pos);
[new_map(411,:), id_counter] = insert_car(map, 411, num2, id_counter, 10, 'row',car_pos);

end

