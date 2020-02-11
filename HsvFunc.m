function [recHvs] = HsvFunc(recreatedImg)
%HSVFUNC Summary of this function goes here
%   Detailed explanation goes here
f= MFTsp(150,0.0847,500);

recHvs(:,:,1) = conv2(recreatedImg(:,:,1),f,'same');
recHvs(:,:,2) = conv2(recreatedImg(:,:,2),f,'same');
recHvs(:,:,3) = conv2(recreatedImg(:,:,3),f,'same');

end

