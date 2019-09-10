%%
map = createMap2(); % 0�� 1· 2��·
map = num2cell(map); %map��Ϊ�������棬mapֻ�ǽ���·���ǵ�·��·�ڣ����򳵵������ǵĵ�ͼ��û�г����˶����г����˶���ͼ��new_map
new_map = randcar(map, 50, 50); %����λ�ú���Ϣ��ʼ�� map��3ά������ʾ����������Ϊ[id;speed;tFlag]
Tx = 200; % ģ��ʱ��
Vmax1 = 20; %��·����
Vmax2 = 10; %С��֧·����
Pchange = 0.7;
Pslow = 0.1;
dsafe = Vmax1;
Flow = [0,0,0,0,0,0,0,0]; %�ṹΪ[��ֱ��·����ֱ��·����֧·����֧·������·�ڣ�����·�ڣ�����·�ڣ�����·��]

%%
figure(1);
img = replaceCars(new_map);
img =  cell2mat(img);
imh=imshow(img,[]); %��ʼ��ͼ���ɫ��ʾ�г�����ɫ��ʾ�ǵ�·
set(imh, 'erasemode', 'none')
axis equal
axis tight

for t=1:Tx
    positions = findcars(new_map,randi([0,1]));
    if size(positions) ~= [0,0] %ϵͳ���г�
        for k=1:size(positions,1) %��������
            i = positions(k,1); %����λ��
            j = positions(k,2);
            v = new_map{i,j}(2); % speed
            direction = 0;

            if j~=1&&j~=2&&j~=4&&j~=5&&j~=406&&j~=407&&j~=409&&j~=410 %��С��֧·�� %%%%%%%%%%%%%ok
                %STNS
                V = accelerate(v, Vmax2);
                gap = findfrontcar(new_map, [i,j]);
                V = slow(V, gap);
                V = randomslow(V, Pslow);
                newpos = updatepos([i,j], V);
                %��С��֧·�ϵĳ�ͨ��·��ʱ������ת
                if newpos(2)>406
                    newpos = [newpos(1)+newpos(2)-406,406];
                elseif newpos(2)<5
                    newpos = [newpos(1)-(5-newpos(2)),5];
                end
                %���µ�ͼ
                new_map = switchpos(new_map, map, [i,j], newpos);
                new_map{newpos(1),newpos(2)}(2) = V;

            else  %��С���ܱߵ���ֱ��·��
                if new_map{i,j}(3)==0 %��ת��
                    V = accelerate(v, Vmax1);
                    [res, direction] = changelane(new_map, [i,j], Pchange, dsafe, Vmax1);
                    if res == 1  % Ҫ����
                        new_map = switchpos(new_map, map, [i,j], [i,j+direction]);
                    end
                    frontcar = findfrontcar(new_map, [i,j+direction]);
                    V = slow(V, frontcar);
                    V = randomslow(V, Pslow);
                    newpos = updatepos([i,j+direction], V); %�õ���������λ��


                elseif new_map{i,j}(3)==1 %ת�䲢��Ҫ�жϴ˴���ʻ�Ƿ�ʻ��ת���
                    V = accelerate(v, Vmax1);
                    
                    if (i==208||i==411) && (j==1||j==2||j==3||j==4||j==5)%ת�䳵����������ת�����  %%%%%%%%%%%%%ok
                        %find the front car
                        for column=j+1:size(new_map,2)
                            if size(new_map{i,column},1)>1 %����������г�
                                frontcar = column - j - 1;
                                break;
                            end
                        end
                        V = slow(V, frontcar);
                        V = randomslow(V, Pslow);
                        newpos = [i,j+V]; %�õ���������λ��
                        new_map = switchpos(new_map, map, [i,j], newpos);
                        new_map{newpos(1),newpos(2)}(2)=V;
                        continue;
                    elseif (i==206||i==409) && (j==406||j==407||j==408||j==409||j==410)%ת�䳵����������ת�����  %%%%%%%%%%%%%ok
                        %find the front car
                        for column=j-1:-1:1
                            if size(new_map{i,column},1)>1 %����������г�
                                frontcar = j - column - 1;
                                break;
                            end
                        end
                        V = slow(V, frontcar);
                        V = randomslow(V, Pslow);
                        newpos = [i,j-V]; %�õ���������λ��
                        new_map = switchpos(new_map, map, [i,j], newpos);
                        new_map{newpos(1),newpos(2)}(2)=V;
                        continue;
                        
                    else %����ԭλ�ò���ת�����
                        [res, direction] = changelane(new_map, [i,j], Pchange, dsafe, Vmax1);
                        if res == 1  % Ҫ����
                            new_map = switchpos(new_map, map, [i,j], [i,j+direction]);
                        end
                        frontcar = findfrontcar(new_map, [i,j+direction]);
                        V = slow(V, frontcar);
                        V = randomslow(V, Pslow);
                        newpos = updatepos([i,j+direction], V);
                        %�жϵõ���newpos�Ƿ񳬹���ת���
                        if newpos(2)==1 || newpos(2)==2
                           if i<208 && newpos(1)>208           %%%%%%%%%%%%%ok
                               for column=newpos(2):size(new_map,2)%�ҳ�ת��ʱ��ǰ��
                                   if size(new_map{208,column},1)>1 %�������г�
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
                               for column=newpos(2):size(new_map,2)%�ҳ�ת��ʱ��ǰ��
                                   if size(new_map{411,column},1)>1 %�������г�
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
                                for column=newpos(2):size(new_map,2) %�ҳ�ת��ʱ��ǰ��
                                   if size(new_map{208,column},1)>1 %�������г�
                                       if newpos(2)+(208-newpos(1))>=column && column~=newpos(2)
                                           %��a=newpos(2)˵���ڵ�ǰ��ת������г������в�����
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
                                for column=newpos(2):size(new_map,2) %�ҳ�ת��ʱ��ǰ��
                                   if size(new_map{411,column},1)>1 %�������г�
                                       if newpos(2)+(411-newpos(1))>=column && column~=newpos(2)
                                           %��a=newpos(2)˵���ڵ�ǰ��ת������г������в�����
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
                                for column=newpos(2):-1:1 %�ҳ�ת��ʱ��ǰ��
                                   if size(new_map{206,column},1)>1 %�������г�
                                       if newpos(2)-(newpos(1)-206)>=column && column~=newpos(2)
                                           %��a=newpos(2)˵���ڵ�ǰ��ת������г������в�����
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
                                for column=newpos(2):-1:1 %�ҳ�ת��ʱ��ǰ��
                                   if size(new_map{409,column},1)>1 %�������г�
                                       if newpos(2)-(newpos(1)-409)>=column && column~=newpos(2)
                                           %��a=newpos(2)˵���ڵ�ǰ��ת������г������в�����
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
                                for column=newpos(2):-1:1 %�ҳ�ת��ʱ��ǰ��
                                   if size(new_map{206,column},1)>1 %�������г�
                                       if newpos(2)-(206-newpos(1))>=column && column~=newpos(2)
                                           %��a=newpos(2)˵���ڵ�ǰ��ת������г������в�����
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
                                for column=newpos(2):-1:1 %�ҳ�ת��ʱ��ǰ��
                                   if size(new_map{409,column},1)>1 %�������г�
                                       if newpos(2)-(409-newpos(1))>=column && column~=newpos(2)
                                           %��a=newpos(2)˵���ڵ�ǰ��ת������г������в�����
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
                if newpos(1)>=1 && newpos(1)<=613 && newpos(2)>=1 && newpos(2)<=410 %��������ϵͳ��
                    %���µ�ͼ
                    new_map = switchpos(new_map, map, [i,j+direction], newpos);
                    new_map{newpos(1),newpos(2)}(2)=V;
                else %�����뿪ϵͳ
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
    set(imh,'cdata',img); %����ͼ��
    %update the step number diaplay
    drawnow;
    
    t
end
result = Flow*3600/Tx;
