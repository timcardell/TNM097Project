

%% 1 unoptimized

load('database.mat');

Img = imread('DB (72).jpg');

[recreatedImg] = unoptimizedDatabase(Img, img_lab, im_resized);
 imshow(recreatedImg)

%% 1.1 read different types of images

%% 1.1.1 Dark Image
Img_Dark = im2double(imread('DB (276).jpg'));

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

load('database.mat');

%% 2.1
load('database.mat');
Img = imread('DB (286).jpg');
Img = im2double(Img);

recreatedImg = optimizedDatabase(Img, img_lab, im_resized);
 imshow(recreatedImg)

%% 2.2 optimize original image
load('database.mat');
Img = imread('DB (84).jpg');
Img = im2double(Img);

[recreatedImg] = optimizedDatabase1(Img, img_lab, im_resized);
 imshow(recreatedImg)


%% 3 find error in images

[~,snr] = psnr(recreatedImg,Resized_Img);
[recHvs] =HsvFunc(recreatedImg);


E_dither = sqrt((Resized_Img(:,:,1)-recHvs(:,:,1)).^2 +(Resized_Img(:,:,2)-recHvs(:,:,2)).^2 +(Resized_Img(:,:,3)-recHvs(:,:,3)).^2);

mean = (1/(width*height))*sum(sum(E_dither));
