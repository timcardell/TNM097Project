%% create database of images

    
   for i= 1:272 %loop through all images, reaize and convert to lab
    
       DB{i} = imread(['DB (' int2str(i) ').jpg']);
       im_resized{i} = imresize(DB{i}, [25 25], 'bicubic');
       img_lab{i} = rgb2lab(im_resized{i});
   end
   
   
% save database
   save('database.mat', 'img_lab','im_resized')
   
   
%%
   