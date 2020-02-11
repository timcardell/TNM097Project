function [meanIntensity] = MeanFunc(Lab_Img)

    [height,width,~] = size(Lab_Img);

        k = 1;
        for i = 1:24:height
            for j = 1:24:width
                meanIntensity(k,j,1) =  mean2(Lab_Img(i,j,1));
                meanIntensity(k,j,2) =  mean2(Lab_Img(i,j,2));
                meanIntensity(k,j,3) =  mean2(Lab_Img(i,j,3));

                 k = k+1;
            end
              
        end
     

end

