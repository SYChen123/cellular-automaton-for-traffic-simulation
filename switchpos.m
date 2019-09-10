function result = switchpos( new_map, map,oldpos, newpos )
%根据车辆的t时刻的位置和t+1时刻的位置，参照map更新new_map
i1 = oldpos(1);
j1 = oldpos(2);
i2 = newpos(1);
j2 = newpos(2);
o = map(i1,j1); %o为t时刻车辆所处位置的路面标记

tmp = new_map(i1,j1);
new_map(i1,j1) = o;
new_map(i2,j2) = tmp;

result = new_map;
end

