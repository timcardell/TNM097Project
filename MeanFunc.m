function [meanIntensity] = MeanFunc(inImg)

    [height,width,~] = size(inImg);
inImg
        k = 1;
        for i = 1:height
            for j = 1:width
                
                   vectY = i:i+25-1;
                   vectX = j:j+25-1;
                   
                meanIntensity(k,vectX,1) =  mean2(inImg(i,j,1));
                meanIntensity(k,vectX,2) =  mean2(inImg(i,j,2));
                meanIntensity(k,vectX,3) =  mean2(inImg(i,j,3));

                 k = k+1;
            end
              
        end
     

end

