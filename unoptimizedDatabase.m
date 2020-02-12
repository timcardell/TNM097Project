function [recreatedImg] = unoptimizedDatabase(Img, img_lab, im_resized)


%% Read in image and databse


%Dark Image
Img_Dark = im2double(imread('DB (72).jpg'));
%Portrait Image
Img_Portrait = im2double(imread('DB (247).jpg'));
%Landscape Image
Img_Landscape = im2double(imread('DB (9).jpg'));

%% resize Image and convert to lab
Resized_Img = imresize(Img,[4000,4000],'bicubic');
%Lab_Img = rgb2lab(Resized_Img);

Lab_Img = applycform(Resized_Img, makecform('srgb2lab'));



%% Calculate mean of given section of image


    DatabaseArray = cell2mat(img_lab);
    [tilewidth,~,~] = size(DatabaseArray);
    
    MeanImage = MeanFunc(Lab_Img,tilewidth);
    MeanImageTiles = MeanFunc(DatabaseArray,tilewidth);

%% Compare mean images
index = CalcDiff(MeanImage,MeanImageTiles);

max(index)
min(index)



%% optimize database by delteing objects "close" to each other

optimizedDataBase = optimizeDataBase(img_lab, MeanImageTiles);


img_lab=optimizedDataBase(~cellfun('isempty',optimizedDataBase));



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
 

%% find error in images

%[~,snr] = psnr(recreatedImg,Resized_Img);
%[recHvs] =HsvFunc(recreatedImg);


%%

%E_dither = sqrt((Resized_Img(:,:,1)-recHvs(:,:,1)).^2 +(Resized_Img(:,:,2)-recHvs(:,:,2)).^2 +(Resized_Img(:,:,3)-recHvs(:,:,3)).^2);

%mean = (1/(width*height))*sum(sum(E_dither));







end

