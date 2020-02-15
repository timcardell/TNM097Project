function  optimization(img_lab, img_resized)

    DatabaseArray = cell2mat(img_lab);
    [tilewidth,~,~] = size(DatabaseArray);
    meanImageTiles = MeanFunc(DatabaseArray,tilewidth);
    
    [length, ~] = size(meanImageTiles);

k = 1;
optLab=[];
 
for i = 1:length
    for j = 1:length
      
      diff = abs(meanImageTiles(i) - meanImageTiles(j));
      
      
      
      if(diff > 140)
         optLab{i} = img_lab{k};
         optRgb{i} = img_resized{k};
          
      end
    end
    k=k+1;
    
end
    optLab=optLab(~cellfun('isempty',optLab));
    optRgb=optRgb(~cellfun('isempty',optRgb));
    save('databaseOpt.mat', 'optLab','optRgb')
    
end

