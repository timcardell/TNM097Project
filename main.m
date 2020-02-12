% main

%% unoptimized 

load('database.mat');
Img = imread('DB (72).jpg');
Img = im2double(Img);

[recreatedImg] = unoptimizedDatabase(Img, img_lab, im_resized);
 imshow(recreatedImg)
 figure
  imshow(Resized_Img)

%%