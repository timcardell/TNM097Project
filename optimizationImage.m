
%input img_lab, im_resized
function  optimizationImage(Img, DBLab,DBRez, tileSize)


[height, width] = size(Img);
factor = height/width;
Resized_Img = imresize(Img,[(round(4000/tileSize)*tileSize),round((4000*factor)/tileSize)*tileSize],'bicubic');

if ismac
    Lab_Img = applycform(Resized_Img, makecform('srgb2lab'));

elseif ispc
    Lab_Img = rgb2lab(Resized_Img);

end


%mean value of tiles
DatabaseArray = cell2mat(DBLab);
[tilewidth,~,~] = size(DatabaseArray);
meanImageTiles = MeanFunc(DatabaseArray,tilewidth);

% mean value in image
meanImage = MeanFunc(Lab_Img,tilewidth);

[length, ~] = size(meanImageTiles);
[lengthMeanImage, ~] = size(meanImage);


DB_optimized=[];
 
for i = 1:lengthMeanImage
    k=1;
    for j = 1:length
      
      diff = floor(abs(meanImage(i) - meanImageTiles(j)));
    
      
      
      if(diff < 5)
          optLabImage{j} = DBLab{k};
          optRgbImage{j} = DBRez{k};
          
          break;
      end
      k=k+1;
    end
    
    
end

    optLabImage=optLabImage(~cellfun('isempty',optLabImage));
    optRgbImage=optRgbImage(~cellfun('isempty',optRgbImage));
    save('databaseOptIm.mat', 'optLabImage','optRgbImage')
end