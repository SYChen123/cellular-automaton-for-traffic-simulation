function map=createMap2
%目字型地图  616*410
%列向路 200
%行向路 400
length1=200;
length2=400;
raw=2*ones(2*5+length1*3+2*3,2*5+length2);
raw([1,2,4,5,5+length1+1,5+length1+3,5+3+2*length1+1,5+3+2*length1+3,5+6+3*length1+1,5+6+3*length1+2,5+6+3*length1+4,5+6+3*length1+5],:)=1;
raw(:,[1,2,4,5,5+length2+1,5+length2+2,5+length2+4,5+length2+5])=1;
%几个路口
raw([1:5,5+length1+1:5+length1+3,5+3+length1*2+1:5+3+length1*2+3,5+6+3*length1+1:5+6+3*length1+5],[1:5,5+length2+1:5+length2+5])=1;
map=raw;
% map(1,1)=0;
%imshow(map,[]);
end