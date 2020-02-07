%% create database of images

    
   for i= 1:10
    
       DB{i} = imread(['DB (' int2str(i) ').jpg']);
       im_resized{i} = imresize(DB{i}, [25 25], 'bicubic');
       
       
       img_lab{i} = rgb2lab(im_resized{i})
   end

   
%%
   
   imshow(im_resized{1})
   
 

