function V = randomslow( v, p )
%以概率p随机慢化
tmp = rand();
if tmp <= p %进行慢化
    V = max(v-1, 0);
else
    V = v;
end
end

