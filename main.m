

%% 1 unoptimized

load('database.mat');

%%
Img = imread('DB (269).jpg');

[recreatedImg] = unoptimizedDatabase(Img, img_lab, im_resized, tileSize);
imshow(recreatedImg)

%% 1.1 read different types of images

%% 1.1.1 Dark Image
Img_Dark = imread('DB (269).jpg');

[recreatedImgDark] = unoptimizedDatabase(Img_Dark, img_lab, im_resized, tileSize);
imshow(recreatedImgDark)


%%  1.1.2 Portrait Image
Img_Portrait = imread('DB (244).jpg');

[recreatedImgPortrait] = unoptimizedDatabase(Img_Portrait, img_lab, im_resized, tileSize);
imshow(recreatedImgPortrait)

%% 1.1.3 Landscape Image
Img_Landscape = imread('DB (9).jpg');

[recreatedImgLandscape] = unoptimizedDatabase(Img_Landscape, img_lab, im_resized, tileSize);
imshow(recreatedImgLandscape)

%% 2 optimize database if the mean diff is close



%% 2.1 optimization 1 only depending on image database, dont run, we didnt submit image data base
%optimization(img_lab, im_resized)

%% run for optimization 1
load('databaseOpt.mat');

Img_opt1 = imread('DB (269).jpg');

[recreatedImgOpt1] = unoptimizedDatabase(Img_opt1, optLab, optRgb, tileSize);
imshow(recreatedImgOpt1)


%% 2.2 optimization 2 depending on in image, run once for chosen image(dont run optimizationImage)


%optimizationImage(Img, img_lab, im_resized, tileSize)
%% run this after prev section
Img = imread('DB (269).jpg');

load('databaseOptIm.mat');


[recreatedImgOpt2] = unoptimizedDatabase(Img, optLabImage, optRgbImage, tileSize);
imshow(recreatedImgOpt2)

%% 3 find error in images

% [~,snr] = psnr(recreatedImg,Resized_Img);
% [recHvs] =HsvFunc(recreatedImg);
% 
% 
% E_dither = sqrt((Resized_Img(:,:,1)-recHvs(:,:,1)).^2 +(Resized_Img(:,:,2)-recHvs(:,:,2)).^2 +(Resized_Img(:,:,3)-recHvs(:,:,3)).^2);
% 
% mean = (1/(width*height))*sum(sum(E_dither));


