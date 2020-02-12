
%input img_lab, im_resized
function [DB_optimized,DB_rezised] = optimizeDataBase(DBLab,DBRez, meanImageTiles)
[length, ~] = size(meanImageTiles);

k = 1;
DB_optimized=[];
 
for i = 1:length
    for j = 1:length
      
      diff = abs(meanImageTiles(i) - meanImageTiles(j));
    
      
      
      if(diff > 50)
          DB_optimized{i} = DBLab{k};
          DB_rezised{i} = DBRez{k};
          
      end
    end
    k=k+1;
    
end


end
