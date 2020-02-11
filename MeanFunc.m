function [meanIntensity] = MeanFunc(inImg,tileWidth)

    [height,width,~] = size(inImg);

        k = 1;
        for i = 1:tileWidth:height
            for j = 1:tileWidth:width
                
                   vectY = i:i+tileWidth-1;
                   vectX = j:j+tileWidth-1;
                   
                 meanIntensity(k,1) =  mean2(inImg(vectY,vectX,1));
                 meanIntensity(k,2) =  mean2(inImg(vectY,vectX,2));
                 meanIntensity(k,3) =  mean2(inImg(vectY,vectX,3));

                 k = k+1;
            end
              
        end
     
meanIntensity
end

