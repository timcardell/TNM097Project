function [meanIntensity] = MeanFunc(inImg)

    [height,width,~] = size(inImg);

        k = 1;
        for i = 1:25:height
            for j = 1:25:width
                
                   vectY = i:i+25-1;
                   vectX = j:j+25-1;
                   
                 meanIntensity(k,1) =  mean2(inImg(vectY,vectX,1));
                 meanIntensity(k,2) =  mean2(inImg(vectY,vectX,2));
                 meanIntensity(k,3) =  mean2(inImg(vectY,vectX,3));

                 k = k+1;
            end
              
        end
     
meanIntensity
end

