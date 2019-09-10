%%
map = createMap2(); % 0车 1路 2非路
map = num2cell(map); %map作为副本保存，map只是将道路，非道路，路口，导向车道特殊标记的地图，没有车辆运动。有车辆运动的图是new_map
new_map = randcar(map, 50, 50); %车辆位置和信息初始化 map中3维向量表示车辆，内容为[id;speed;tFlag]
Tx = 200; % 模拟时长
Vmax1 = 20; %公路限速
Vmax2 = 10; %小区支路限速
Pchange = 0.7;
Pslow = 0.1;
dsafe = Vmax1;
Flow = [0,0,0,0,0,0,0,0]; %结构为[竖直左路，竖直右路，上支路，下支路，左上路口，右上路口，左下路口，右下路口]

%%
figure(1);
img = replaceCars(new_map);
img =  cell2mat(img);
imh=imshow(img,[]); %初始化图像黑色表示有车，白色表示非道路
set(imh, 'erasemode', 'none')
axis equal
axis tight

for t=1:Tx
    positions = findcars(new_map,randi([0,1]));
    if size(positions) ~= [0,0] %系统内有车
        for k=1:size(positions,1) %车辆个数
            i = positions(k,1); %车辆位置
            j = positions(k,2);
            v = new_map{i,j}(2); % speed
            direction = 0;

            if j~=1&&j~=2&&j~=4&&j~=5&&j~=406&&j~=407&&j~=409&&j~=410 %在小区支路上 %%%%%%%%%%%%%ok
                %STNS
                V = accelerate(v, Vmax2);
                gap = findfrontcar(new_map, [i,j]);
                V = slow(V, gap);
                V = randomslow(V, Pslow);
                newpos = updatepos([i,j], V);
                %在小区支路上的车通过路口时必须右转
                if newpos(2)>406
                    newpos = [newpos(1)+newpos(2)-406,406];
                elseif newpos(2)<5
                    newpos = [newpos(1)-(5-newpos(2)),5];
                end
                %更新地图
                new_map = switchpos(new_map, map, [i,j], newpos);
                new_map{newpos(1),newpos(2)}(2) = V;

            else  %在小区周边的竖直公路上
                if new_map{i,j}(3)==0 %不转弯
                    V = accelerate(v, Vmax1);
                    [res, direction] = changelane(new_map, [i,j], Pchange, dsafe, Vmax1);
                    if res == 1  % 要换道
                        new_map = switchpos(new_map, map, [i,j], [i,j+direction]);
                    end
                    frontcar = findfrontcar(new_map, [i,j+direction]);
                    V = slow(V, frontcar);
                    V = randomslow(V, Pslow);
                    newpos = updatepos([i,j+direction], V); %得到车辆的新位置


                elseif new_map{i,j}(3)==1 %转弯并且要判断此次行驶是否驶过转弯点
                    V = accelerate(v, Vmax1);
                    
                    if (i==208||i==411) && (j==1||j==2||j==3||j==4||j==5)%转弯车辆正好在左转弯点上  %%%%%%%%%%%%%ok
                        %find the front car
                        for column=j+1:size(new_map,2)
                            if size(new_map{i,column},1)>1 %这个格子里有车
                                frontcar = column - j - 1;
                                break;
                            end
                        end
                        V = slow(V, frontcar);
                        V = randomslow(V, Pslow);
                        newpos = [i,j+V]; %得到车辆的新位置
                        new_map = switchpos(new_map, map, [i,j], newpos);
                        new_map{newpos(1),newpos(2)}(2)=V;
                        continue;
                    elseif (i==206||i==409) && (j==406||j==407||j==408||j==409||j==410)%转弯车辆正好在右转弯点上  %%%%%%%%%%%%%ok
                        %find the front car
                        for column=j-1:-1:1
                            if size(new_map{i,column},1)>1 %这个格子里有车
                                frontcar = j - column - 1;
                                break;
                            end
                        end
                        V = slow(V, frontcar);
                        V = randomslow(V, Pslow);
                        newpos = [i,j-V]; %得到车辆的新位置
                        new_map = switchpos(new_map, map, [i,j], newpos);
                        new_map{newpos(1),newpos(2)}(2)=V;
                        continue;
                        
                    else %车辆原位置不在转弯点上
                        [res, direction] = changelane(new_map, [i,j], Pchange, dsafe, Vmax1);
                        if res == 1  % 要换道
                            new_map = switchpos(new_map, map, [i,j], [i,j+direction]);
                        end
                        frontcar = findfrontcar(new_map, [i,j+direction]);
                        V = slow(V, frontcar);
                        V = randomslow(V, Pslow);
                        newpos = updatepos([i,j+direction], V);
                        %判断得到的newpos是否超过了转弯点
                        if newpos(2)==1 || newpos(2)==2
                           if i<208 && newpos(1)>208           %%%%%%%%%%%%%ok
                               for column=newpos(2):size(new_map,2)%找出转弯时的前车
                                   if size(new_map{208,column},1)>1 %格子里有车
                                       if newpos(2)+(newpos(1)-208)>=column && column~=newpos(2)
                                           newpos(2) = column-1;
                                       else
                                           newpos(2) = newpos(2)+(newpos(1)-208);
                                       end
                                       break;
                                   end
                               end
                               %newpos(2) = newpos(2)+(newpos(1)-208);
                               newpos(1) = 208;
                           elseif i<411 && newpos(1)>411
                               for column=newpos(2):size(new_map,2)%找出转弯时的前车
                                   if size(new_map{411,column},1)>1 %格子里有车
                                       if newpos(2)+(newpos(1)-411)>=column && column~=newpos(2)
                                           newpos(2) = column-1;
                                       else
                                           newpos(2) = newpos(2)+(newpos(1)-411);
                                       end
                                       break;
                                   end
                               end
                               %newpos(2) = newpos(2)+(newpos(1)-411);
                               newpos(1) = 411;
                           end
                        elseif newpos(2)==4 ||newpos(2)==5
                            if i>208 && newpos(1)<208      %%%%%%%%%%%%%ok
                                for column=newpos(2):size(new_map,2) %找出转弯时的前车
                                   if size(new_map{208,column},1)>1 %格子里有车
                                       if newpos(2)+(208-newpos(1))>=column && column~=newpos(2)
                                           %若a=newpos(2)说明在当前列转弯点上有车，则列不更新
                                           newpos(2) = column-1;
                                       else
                                           newpos(2) = newpos(2)+(208-newpos(1));
                                       end
                                       break;
                                   end
                                end
                                %newpos(2) = newpos(2)+(208-newpos(1));
                                newpos(1) = 208;
                            elseif i>411 && newpos(1)<411
                                for column=newpos(2):size(new_map,2) %找出转弯时的前车
                                   if size(new_map{411,column},1)>1 %格子里有车
                                       if newpos(2)+(411-newpos(1))>=column && column~=newpos(2)
                                           %若a=newpos(2)说明在当前列转弯点上有车，则列不更新
                                           newpos(2) = column-1;
                                       else
                                           newpos(2) = newpos(2)+(411-newpos(1));
                                       end
                                       break;
                                   end
                                end
                                %newpos(2) = newpos(2)+(411-newpos(1));
                                newpos(1) = 411;
                            end
                        elseif newpos(2)==406 || newpos(2)==407
                            if i<206 && newpos(1)>206      %%%%%%%%%%%%%ok
                                for column=newpos(2):-1:1 %找出转弯时的前车
                                   if size(new_map{206,column},1)>1 %格子里有车
                                       if newpos(2)-(newpos(1)-206)>=column && column~=newpos(2)
                                           %若a=newpos(2)说明在当前列转弯点上有车，则列不更新
                                           newpos(2) = column+1;
                                       else
                                           newpos(2) = newpos(2)-(newpos(1)-206);
                                       end
                                       break;
                                   end
                                end
                                %newpos(2) = newpos(2)-(newpos(1)-206);
                                newpos(1) = 206;
                            elseif i<409 && newpos(1)>409
                                for column=newpos(2):-1:1 %找出转弯时的前车
                                   if size(new_map{409,column},1)>1 %格子里有车
                                       if newpos(2)-(newpos(1)-409)>=column && column~=newpos(2)
                                           %若a=newpos(2)说明在当前列转弯点上有车，则列不更新
                                           newpos(2) = column+1;
                                       else
                                           newpos(2) = newpos(2)-(newpos(1)-409);
                                       end
                                       break;
                                   end
                                end
                                %newpos(2) = newpos(2)-(newpos(1)-409);
                                newpos(1) = 409;
                            end
                        elseif newpos(2)==409 || newpos(2)==410
                            if i>206 && newpos(1)<206        %%%%%%%%%%%%%ok
                                for column=newpos(2):-1:1 %找出转弯时的前车
                                   if size(new_map{206,column},1)>1 %格子里有车
                                       if newpos(2)-(206-newpos(1))>=column && column~=newpos(2)
                                           %若a=newpos(2)说明在当前列转弯点上有车，则列不更新
                                           newpos(2) = column+1;
                                       else
                                           newpos(2) = newpos(2)-(206-newpos(1));
                                       end
                                       break;
                                   end
                                end
                                %newpos(2) = newpos(2)-(206-newpos(1));
                                newpos(1) = 206;
                            elseif i>409 && newpos(1)<409
                                for column=newpos(2):-1:1 %找出转弯时的前车
                                   if size(new_map{409,column},1)>1 %格子里有车
                                       if newpos(2)-(409-newpos(1))>=column && column~=newpos(2)
                                           %若a=newpos(2)说明在当前列转弯点上有车，则列不更新
                                           newpos(2) = column+1;
                                       else
                                           newpos(2) = newpos(2)-(409-newpos(1));
                                       end
                                       break;
                                   end
                                end
                                %newpos(2) = newpos(2)-(409-newpos(1));
                                newpos(1) = 409;
                            end
                        end
                    end
                end
                
                %%%%%%%%%%%%%
                if newpos(1)>=1 && newpos(1)<=613 && newpos(2)>=1 && newpos(2)<=410 %车辆还在系统内
                    %更新地图
                    new_map = switchpos(new_map, map, [i,j+direction], newpos);
                    new_map{newpos(1),newpos(2)}(2)=V;
                else %车辆离开系统
                    ID = new_map{i,j}(1);
                    speed = randi(Vmax1);
                    tmp = [0,1];
                    tFlag = tmp(randi(2));
                    carinfo = [ID;speed;tFlag];
%                     if j==406||j==407
%                         new_map{newpos(1)-613,j-405} = carinfo;
%                     elseif j==1||j==2
%                         new_map{newpos(1)-613,j+405} = carinfo;
%                     elseif j==409||j==410
%                         new_map{newpos(1)+613,j-405} = carinfo;
%                     elseif j==4||j==5
%                         new_map{newpos(1)+613,j+405} = carinfo;
%                     end
                    if newpos(2)==1||newpos(2)==2||newpos(2)==406||newpos(2)==407
                        new_map{newpos(1)-613,newpos(2)} = carinfo;
                    elseif newpos(2)==4||newpos(2)==5||newpos(2)==409||newpos(2)==410
                        new_map{newpos(1)+613,newpos(2)} = carinfo;
                    end
                    new_map(i,j) = map(i,j);
                end
            end
            
            Flow = carflow(Flow,[i,j],newpos);
            
        end
    end
    %draw img
    img = replaceCars(new_map);
    img =  cell2mat(img);
    set(imh,'cdata',img); %更新图像
    %update the step number diaplay
    drawnow;
    
    t
end
result = Flow*3600/Tx;
