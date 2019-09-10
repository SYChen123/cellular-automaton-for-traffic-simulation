function V = slow( v, gap )
%减速 gap为此车与当前车道前车间距
V = min(v, gap);
end

