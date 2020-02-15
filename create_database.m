%% create database of images


   tileSize = 25;
   for i= 1:310 %loop through all images, reaize and convert to lab


       DB{i} = imread(['DB (' int2str(i) ').jpg']);
       im_resized{i} = imresize(DB{i}, [tileSize tileSize], 'bicubic');

        if ismac
         img_lab{i} = applycform(im_resized{i}, makecform('srgb2lab'));

        elseif ispc
         img_lab{i} = rgb2lab(im_resized{i});

        end

    end





% save database
   save('database.mat', 'img_lab','im_resized', 'tileSize')


%%
