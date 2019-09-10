function new_pos = updatepos( pos, V )
%地图不同时要改！
%位置更新 x为当前位置 V为最终确定的速度
i = pos(1);
j = pos(2);
if j==1||j==2||j==406||j==407 %在小区周边的公路上
    i = i +V;
elseif j==4||j==5||j==409||j==410 
    i = i - V;
elseif (i==206||i==409) && j > 5 && j < 406 %在小区中间的支路上
    j = j - V;
elseif (i==208||i==411) && j > 5 && j < 406
    j = j + V;
end
new_pos = [i,j];
end

