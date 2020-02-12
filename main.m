

%% 1 unoptimized 

load('database.mat');
Img = imread('DB (277).jpg');
Img = im2double(Img);

[recreatedImg] = unoptimizedDatabase(Img, img_lab, im_resized);
 imshow(recreatedImg)
%% 1.1 read different types of images 
 
%% 1.1.1 Dark Image
Img_Dark = im2double(imread('DB (277).jpg'));

[recreatedImgDark] = unoptimizedDatabase(Img_Dark, img_lab, im_resized);
imshow(recreatedImgDark)


%%  1.1.2 Portrait Image
Img_Portrait = im2double(imread('DB (247).jpg'));

[recreatedImgPortrait] = unoptimizedDatabase(Img_Portrait, img_lab, im_resized);
imshow(recreatedImgPortrait)

%% 1.1.3 Landscape Image
Img_Landscape = im2double(imread('DB (9).jpg'));

[recreatedImgLandscape] = unoptimizedDatabase(Img_Landscape, img_lab, im_resized);
imshow(recreatedImgLandscape)

%% 2 optimize database if the mean diff is close

%% 2.1



 

