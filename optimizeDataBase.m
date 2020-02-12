
%input img_lab, im_resized
function [DB_optimized] = optimizeDataBase(DBLab, meanImageTiles)
[length, ~] = size(meanImageTiles);

k = 1;
DB_optimized=[];
 
for i = 1:length
    for j = 1:length
      
      diff = abs(meanImageTiles(i) - meanImageTiles(j));
    
      
      
      if(diff > 60)
          DB_optimized{i} = DBLab{k};
          
      end
    end
    k=k+1;
    
end


end
