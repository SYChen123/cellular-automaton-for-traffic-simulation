function V = randomslow( v, p )
%�Ը���p�������
tmp = rand();
if tmp <= p %��������
    V = max(v-1, 0);
else
    V = v;
end
end

