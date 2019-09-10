function img = replaceCars(new_map)
for i=1:size(new_map,1)
    for j=1:size(new_map,2)
        if size(new_map{i,j},1)>1
            new_map{i,j} = 0;
        else
            if new_map{i,j} == -1 || new_map{i,j} == -2
                new_map{i,j} = 1;
            end
        end
    end
end
img = new_map;
end

