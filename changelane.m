function [result,direction] = changelane( new_map, pos, Pchange, dsafe, Vmax)
%地图不同时要改！
%随机变道 pos为此车位置 Pchange为变道概率 dsafe是与后车变道安全距离
%返回是否变道result、变道方向direction（-1左 1右）、与当前车道前车间距（省的后面再算）
result = 0;
direction = 0;
i = pos(1);
j = pos(2);
frontcar1 = 0; %与当前车道前车距离
frontcar2 = 0; %与旁边车道前车距离
backcar2 = 0; %与旁边车道后车距离
if Pchange ~= 0 %不在导向车道或路口区域内
    if rand() <= Pchange % 进行变道
        if j==1 %在不同的车道上
           for k=i+1:size(new_map, 1) %找此车与当前车道前车距离
                if size(new_map{k,j},1)>1 % 这个格子里有车
                    frontcar1 = k - i -1;
                    break;
                end
           end
           for k=i+1:size(new_map, 1) %找此车与旁边车道前车距离
                if size(new_map{k,j+1},1)>1 % 这个格子里有车
                    frontcar2 = k - i -1;
                    break;
                end
           end
           for k=i-1:-1:1 %找此车与旁边车道后车距离
                if size(new_map{k,j+1},1)>1 % 这个格子里有车
                    backcar2 = i - k -1;
                    break;
                end
           end
           if  frontcar1 < min(new_map{i,j}(2)+1, Vmax) && frontcar2 > frontcar1 && backcar2 > dsafe && size(new_map{i,j+1},1)==1  
               %满足换道动机和安全条件并且旁边车道对应位置没车
               result = 1;
               direction = 1;
           end
           
           
           
           
        elseif j==2
            for k=i+1:size(new_map, 1) %找此车与当前车道前车距离
                if size(new_map{k,j},1)>1 % 这个格子里有车
                    frontcar1 = k - i -1;
                    break;
                end
            end
            for k=i+1:size(new_map, 1) %找此车与旁边车道前车距离
                if size(new_map{k,j-1},1)>1 % 这个格子里有车
                    frontcar2 = k - i -1;
                    break;
                end
            end
            for k=i-1:-1:1 %找此车与旁边车道后车距离
                if size(new_map{k,j-1},1)>1 % 这个格子里有车
                    backcar2 = i - k -1;
                    break;
                end
            end
           if  frontcar1 < min(new_map{i,j}(2)+1, Vmax) && frontcar2 > frontcar1 && backcar2 > dsafe && size(new_map{i,j-1},1)==1  
               %满足换道动机和安全条件并且旁边车道对应位置没车
               result = 1;
               direction = -1;
           end
           
           
           
        elseif j==4
            for k=i-1:-1:1 %找此车与当前车道前车距离
                if size(new_map{k,j},1)>1 % 这个格子里有车
                    frontcar1 = i - k -1;
                    break;
                end
            end
            for k=i-1:-1:1 %找此车与旁边车道前车距离
                if size(new_map{k,j+1},1)>1 % 这个格子里有车
                    frontcar2 = i - k -1;
                    break;
                end
            end
            for k=i+1:size(new_map,1) %找此车与旁边车道后车距离
                if size(new_map{k,j+1},1)>1 % 这个格子里有车
                    backcar2 = k - i -1;
                    break;
                end
            end
            if  frontcar1 < min(new_map{i,j}(2)+1, Vmax) && frontcar2 > frontcar1 && backcar2 > dsafe && size(new_map{i,j+1},1)==1  
               %满足换道动机和安全条件并且旁边车道对应位置没车
               result = 1;
               direction = 1;
            end
            
            
            
            
        elseif j==5
            for k=i-1:-1:1 %找此车与当前车道前车距离
                if size(new_map{k,j},1)>1 % 这个格子里有车
                    frontcar1 = i - k -1;
                    break;
                end
            end
            for k=i-1:-1:1 %找此车与旁边车道前车距离
                if size(new_map{k,j-1},1)>1 % 这个格子里有车
                    frontcar2 = i - k -1;
                    break;
                end
            end
            for k=i+1:size(new_map,1) %找此车与旁边车道后车距离
                if size(new_map{k,j-1},1)>1 % 这个格子里有车
                    backcar2 = k - i -1;
                    break;
                end
            end
            if  frontcar1 < min(new_map{i,j}(2)+1, Vmax) && frontcar2 > frontcar1 && backcar2 > dsafe && size(new_map{i,j-1},1)==1  
               %满足换道动机和安全条件并且旁边车道对应位置没车
               result = 1;
               direction = -1;
            end
            
            
            
            
        elseif j==406 %在不同的车道上
           for k=i+1:size(new_map, 1) %找此车与当前车道前车距离
                if size(new_map{k,j},1)>1 % 这个格子里有车
                    frontcar1 = k - i -1;
                    break;
                end
           end
           for k=i+1:size(new_map, 1) %找此车与旁边车道前车距离
                if size(new_map{k,j+1},1)>1 % 这个格子里有车
                    frontcar2 = k - i -1;
                    break;
                end
           end
           for k=i-1:-1:1 %找此车与旁边车道后车距离
                if size(new_map{k,j+1},1)>1 % 这个格子里有车
                    backcar2 = i - k -1;
                    break;
                end
           end
           if  frontcar1 < min(new_map{i,j}(2)+1, Vmax) && frontcar2 > frontcar1 && backcar2 > dsafe && size(new_map{i,j+1},1)==1  
               %满足换道动机和安全条件并且旁边车道对应位置没车
               result = 1;
               direction = 1;
           end
           
           
           
           
        elseif j==407
            for k=i+1:size(new_map, 1) %找此车与当前车道前车距离
                if size(new_map{k,j},1)>1 % 这个格子里有车
                    frontcar1 = k - i -1;
                    break;
                end
            end
            for k=i+1:size(new_map, 1) %找此车与旁边车道前车距离
                if size(new_map{k,j-1},1)>1 % 这个格子里有车
                    frontcar2 = k - i -1;
                    break;
                end
            end
            for k=i-1:-1:1 %找此车与旁边车道后车距离
                if size(new_map{k,j-1},1)>1 % 这个格子里有车
                    backcar2 = i - k -1;
                    break;
                end
            end
           if  frontcar1 < min(new_map{i,j}(2)+1, Vmax) && frontcar2 > frontcar1 && backcar2 > dsafe && size(new_map{i,j-1},1)==1  
               %满足换道动机和安全条件并且旁边车道对应位置没车
               result = 1;
               direction = -1;
           end
           
           
           
        elseif j==409
            for k=i-1:-1:1 %找此车与当前车道前车距离
                if size(new_map{k,j},1)>1 % 这个格子里有车
                    frontcar1 = i - k -1;
                    break;
                end
            end
            for k=i-1:-1:1 %找此车与旁边车道前车距离
                if size(new_map{k,j+1},1)>1 % 这个格子里有车
                    frontcar2 = i - k -1;
                    break;
                end
            end
            for k=i+1:size(new_map,1) %找此车与旁边车道后车距离
                if size(new_map{k,j+1},1)>1 % 这个格子里有车
                    backcar2 = k - i -1;
                    break;
                end
            end
            if  frontcar1 < min(new_map{i,j}(2)+1, Vmax) && frontcar2 > frontcar1 && backcar2 > dsafe && size(new_map{i,j+1},1)==1  
               %满足换道动机和安全条件并且旁边车道对应位置没车
               result = 1;
               direction = 1;
            end
            
            
            
            
        elseif j==410
            for k=i-1:-1:1 %找此车与当前车道前车距离
                if size(new_map{k,j},1)>1 % 这个格子里有车
                    frontcar1 = i - k -1;
                    break;
                end
            end
            for k=i-1:-1:1 %找此车与旁边车道前车距离
                if size(new_map{k,j-1},1)>1 % 这个格子里有车
                    frontcar2 = i - k -1;
                    break;
                end
            end
            for k=i+1:size(new_map,1) %找此车与旁边车道后车距离
                if size(new_map{k,j-1},1)>1 % 这个格子里有车
                    backcar2 = k - i -1;
                    break;
                end
            end
            if  frontcar1 < min(new_map{i,j}(2)+1, Vmax) && frontcar2 > frontcar1 && backcar2 > dsafe && size(new_map{i,j-1},1)==1  
               %满足换道动机和安全条件并且旁边车道对应位置没车
               result = 1;
               direction = -1;
            end
        end
    end
end
end

