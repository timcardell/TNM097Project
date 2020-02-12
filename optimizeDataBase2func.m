
%input img_lab, im_resized
function [DB_optimized,DB_rezised] = optimizeDataBase2func(meanImage, DBLab,DBRez, meanImageTiles)
[length, ~] = size(meanImageTiles);
[lengthMeanImage, ~] = size(meanImage);


DB_optimized=[];
 
for i = 1:lengthMeanImage
    k=1;
    for j = 1:length
      
      diff = floor(abs(meanImage(i) - meanImageTiles(j)));
    
      
      
      if(diff < 5)
          DB_optimized{j} = DBLab{k};
          DB_rezised{j} = DBRez{k};
          
          break;
      end
      k=k+1;
    end
    
    
end


end
