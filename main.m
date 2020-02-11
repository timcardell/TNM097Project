

%% Read in image and databse
load('database.mat');
Img = imread('DB (72).jpg');
Img = im2double(Img);
%% resize Image and convert to lab
Resized_Img = imresize(Img,[2000,1200],'bicubic');
Lab_Img = RGB2Lab(Resized_Img);


%% Calculate mean of given section of image

    MeanImage = MeanFunc(Lab_Img);
    DatabaseArray = (cell2mat(img_lab));
    MeanImageTiles = MeanFunc(DatabaseArray);

%% Compare mean images
index = CalcDiff(MeanImage,MeanImageTiles);
    
%% Use Index matrix to recreate the image
[width,height,~] = size(Lab_Img);

recreatedImg = [];
k = 1;
for i = 1:25:width
    for j = 1:25:height
        
    vectY = i:i+25-1;
    vectX = j:j+25-1;
        
    temp = im2double(im_resized{index(:,k)});
     
    recreatedImg(vectY, vectX, :) = temp;

       k = k +1; 
    
    end
end
    imshow(recreatedImg)







