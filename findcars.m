function pos = findcars(new_map,num)
%找到地图中的车辆 返回n*2的矩阵；num表示更新顺序
pos = [];
k=1;
if num==0
    for i=1:size(new_map,1)
        for j=1:size(new_map,2)
            if size(new_map{i,j},1)>1
                pos(k,1) = i;
                pos(k,2) = j;
                k = k + 1;
            end
        end
    end
elseif num==1
    for i=size(new_map,1):-1:1
        for j=size(new_map,2):-1:1
            if size(new_map{i,j},1)>1
                pos(k,1) = i;
                pos(k,2) = j;
                k = k + 1;
            end
        end
    end
end
end

