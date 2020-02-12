function [outputArg1,outputArg2] = optimizedDatabase1(inputArg1,inputArg2)

%% optimize database by delteing objects "close" to each other

optimizedDataBase = optimizeDataBase(img_lab, MeanImageTiles);


img_lab=optimizedDataBase(~cellfun('isempty',optimizedDataBase));





end

