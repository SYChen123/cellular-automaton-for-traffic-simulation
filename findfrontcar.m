function frontcar = findfrontcar( new_map, pos )
%地图不同时要改！
%找到当前车道的前车
i = pos(1);
j = pos(2);
frontcar = 1000;
if j==1 %在不同的车道上
   for k=i+1:size(new_map, 1) %找此车与当前车道前车距离
        if size(new_map{k,j},1)>1 % 这个格子里有车
            frontcar = k - i -1;
            break;
        end
   end
   
elseif j==2
    for k=i+1:size(new_map, 1) %找此车与当前车道前车距离
        if size(new_map{k,j},1)>1 % 这个格子里有车
            frontcar = k - i -1;
            break;
        end
    end
   
elseif j==4
    for k=i-1:-1:1 %找此车与当前车道前车距离
        if size(new_map{k,j},1)>1 % 这个格子里有车
            frontcar = i - k -1;
            break;
        end
    end
    
elseif j==5
    for k=i-1:-1:1 %找此车与当前车道前车距离
        if size(new_map{k,j},1)>1 % 这个格子里有车
            frontcar = i - k -1;
            break;
        end
    end
    
elseif j==406 %在不同的车道上
   for k=i+1:size(new_map, 1) %找此车与当前车道前车距离
        if size(new_map{k,j},1)>1 % 这个格子里有车
            frontcar = k - i -1;
            break;
        end
   end

elseif j==407
    for k=i+1:size(new_map, 1) %找此车与当前车道前车距离
        if size(new_map{k,j},1)>1 % 这个格子里有车
            frontcar = k - i -1;
            break;
        end
    end
    
elseif j==409
    for k=i-1:-1:1 %找此车与当前车道前车距离
        if size(new_map{k,j},1)>1 % 这个格子里有车
            frontcar = i - k -1;
            break;
        end
    end
    
elseif j==410
    for k=i-1:-1:1 %找此车与当前车道前车距离
        if size(new_map{k,j},1)>1 % 这个格子里有车
            frontcar = i - k -1;
            break;
        end
    end
    
end
end

