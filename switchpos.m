function result = switchpos( new_map, map,oldpos, newpos )
%���ݳ�����tʱ�̵�λ�ú�t+1ʱ�̵�λ�ã�����map����new_map
i1 = oldpos(1);
j1 = oldpos(2);
i2 = newpos(1);
j2 = newpos(2);
o = map(i1,j1); %oΪtʱ�̳�������λ�õ�·����

tmp = new_map(i1,j1);
new_map(i1,j1) = o;
new_map(i2,j2) = tmp;

result = new_map;
end

