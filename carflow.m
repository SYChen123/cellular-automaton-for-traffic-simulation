function result = carflow(flow,oldpos,newpos)
%��ͼ��ͬʱҪ�ģ����վ�� ���һЩ���
%ͳ��ÿ��·�ϵ�ĳһ�����ڴ�ʱͨ���ĳ�������
%oldpos newpos�ֱ�Ϊһ�����ڸ���ǰ���λ��
%result�ṹΪ[��ֱ��·����ֱ��·��ˮƽ·������·��]��accumulate����ǰ���۵Ľ�������ݽṹͬresult
result = flow;
spot1 = [150,1;
        450,406]; %2��վ��
spot2 = [206,200;409,200]; %2��վ��
%����·��
spot3 = [205,1;205,2;209,4;209,5];
spot4 = [205,406;205,407;209,409;209,410];
spot5 = [408,1;408,2;412,4;412,5];
spot6 = [408,406;408,407;412,409;412,410];

i1 = oldpos(1);
j1 = oldpos(2);
i2 = newpos(1);
j2 = newpos(2);
if i1<spot1(1,1)&&i2>=spot1(1,1)&&(j1==1||j1==2) %��ֱ��·
    result(1) = result(1)+1;
elseif i1>spot1(1,1)&&i2<=spot1(1,1)&&(j1==4||j1==5)%��ֱ��·
    result(1) = result(1)+1;
elseif i1<spot1(2,1)&&i2>=spot1(2,1)&&(j1==406||j1==407)%��ֱ��·
    result(2) = result(2)+1;
elseif i1>spot1(2,1)&&i2<=spot1(2,1)&&(j1==409||j1==410)%��ֱ��·
    result(2) = result(2)+1;
elseif j1<200&&j2>=200&&i1==208 %С����֧·
    result(3) = result(3)+1;
elseif j1>200&&j2<=200&&i1==206 %С����֧·
    result(3) = result(3)+1;
elseif j1<200&&j2>=200&&i1==411 %С����֧·
    result(4) = result(4)+1;
elseif j1>200&&j2<=200&&i1==409 %С����֧·
    result(4) = result(4)+1;
elseif (i1<205&&i2>=205&&(j1==1||j1==2))||(i1>209&&i2<=209&&(j1==4||j1==5))%����·��
    result(5) = result(5)+1;
elseif (i1<205&&i2>=205&&(j1==406||j1==407))||(i1>209&&i2<=209&&(j1==409||j1==410))%����·��
    result(6) = result(6)+1;
elseif (i1<408&&i2>=408&&(j1==1||j1==2))||(i1>412&&i2<=412&&(j1==4||j1==5))%����·��
    result(7) = result(7)+1;
elseif (i1<408&&i2>=408&&(j1==406||j1==407))||(i1>412&&i2<=412&&(j1==409||j1==410))%����·��
    result(8) = result(8)+1;
end
end

% count = 0;
% for i=1:size(spot1,1) %ÿ��ѭ����ʾһ��վ��
%     count = 0;
%     a = new_map{spot1(i,1),spot1(i,2)};
%     b = new_map{spot1(i,1),spot1(i,2)+1};
%     c = new_map{spot1(i,1),spot1(i,2)+3};
%     d = new_map{spot1(i,1),spot1(i,2)+4};
%     if size(a,1)>1
%         count = count+1;
%     end
%     if size(b,1)>1
%         count = count+1;
%     end
%     if size(c,1)>1
%         count = count+1;
%     end
%     if size(d,1)>1
%         count = count+1;
%     end
%     
%     result(i) = result(i)+count;
% end
% 
% for i=1:size(spot2,1) %ÿ��ѭ����ʾһ��վ��
%     count = 0;
%     a = new_map{spot2(i,1),spot2(i,2)};
%     b = new_map{spot2(i,1)+2,spot2(i,2)};
%     if size(a,1)>1
%         count = count+1;
%     end
%     if size(b,1)>1
%         count = count+1;
%     end
%     
%     result(i+size(spot1,1)) = result(i+size(spot1,1))+count;
% end
% 
% count = 0;
% for i=1:size(spot3,1) %����ѭ�������ű�ʾһ��վ��
%     a = new_map{spot3(i,1),spot3(i,2)};
%     if size(a,1)>1
%         count = count + 1;
%     end
% end
% result(size(spot1,1)+size(spot2,1)+1) = result(size(spot1,1)+size(spot2,1)+1)+count;
% 
% count = 0;
% for i=1:size(spot4,1) %����ѭ�������ű�ʾһ��վ��
%     a = new_map{spot4(i,1),spot4(i,2)};
%     if size(a,1)>1
%         count = count + 1;
%     end
% end
% result(size(spot1,1)+size(spot2,1)+1+1) = result(size(spot1,1)+size(spot2,1)+1+1)+count;
% 
