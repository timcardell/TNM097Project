function [recreatedImg] = unoptimizedDatabase(Img, img_lab, im_resized)

%% resize Image and convert to lab
[heightResizedIm, widthResizedIm, ~] = size(Img)

if(heightResizedIm <999 && widthResizedIm <999)
    
    
    heightFact = heightResizedIm/1000;
    widthFact = widthResizedIm/1000;
 

elseif(heightResizedIm > 999 && widthResizedIm > 999)
    
    
    heightFact = heightResizedIm/10000;
    widthFact = widthResizedIm/10000;
end

Resized_Img = imresize(Img,[roundn(8000*heightFact, 2),roundn(8000*widthFact, 2)],'bicubic');

if ismac
    Lab_Img = applycform(Resized_Img, makecform('srgb2lab'));

elseif ispc
    Lab_Img = rgb2lab(Resized_Img);
   
end



%% Calculate mean of given section of image


    DatabaseArray = cell2mat(img_lab);
    [tilewidth,~,~] = size(DatabaseArray);
    
    MeanImage = MeanFunc(Lab_Img,tilewidth);
    MeanImageTiles = MeanFunc(DatabaseArray,tilewidth);

%% Compare mean images
index = CalcDiff(MeanImage,MeanImageTiles);

max(index);
min(index);




%% Use Index matrix to recreate the image
[width,height,~] = size(Lab_Img);

recreatedImg = [];
k = 1;
for i = 1:tilewidth:width
    for j = 1:tilewidth:height
        
    vectY = i:i+tilewidth-1;
    vectX = j:j+tilewidth-1;
        
    temp = im2double(im_resized{index(:,k)});
     
    recreatedImg(vectY, vectX, :) = temp;

       k = k +1; 
    
    end
end
 




end

