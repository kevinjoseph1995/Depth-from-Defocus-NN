depth_map_temp=zeros(size(depth_map));
for i=1:size(depth_map,1)
    for j=1:size(depth_map,2)
        if(depth_map(i,j)>5)
            depth_map_temp(i,j)=20;
        else
            depth_map_temp(i,j)=depth_map(i,j);
        end
    
    end
end
depth_map_temp=medfilt2(depth_map_temp);
surf(depth_map_temp);