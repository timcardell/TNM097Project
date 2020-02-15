function [recreatedImg] = unoptimizedDatabase(Img, img_lab, im_resized, tileSize)

%% resize Image and convert to lab
[heightResizedIm, widthResizedIm, ~] = size(Img);


scale_factor = heightResizedIm/widthResizedIm

if(scale_factor > 1.5)
    Resized_Img = imresize(Img,[(round(4000/tileSize)*tileSize),round((4000/scale_factor)/tileSize)*tileSize],'bicubic');

    
elseif(scale_factor < 1.5 && scale_factor > 1)
    Resized_Img = imresize(Img,[(round(4000/tileSize)*tileSize),round((4000/scale_factor)/tileSize)*tileSize],'bicubic');

elseif(scale_factor < 1 && scale_factor > 0.49)
    Resized_Img = imresize(Img,[(round(3000/tileSize)*tileSize),round((3000/scale_factor)/tileSize)*tileSize],'bicubic');

else
     Resized_Img = imresize(Img,[(round(4000/tileSize)*tileSize),round((4000/scale_factor)/tileSize)*tileSize],'bicubic');
end
    

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
