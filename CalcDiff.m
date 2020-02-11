function [index] = CalcDiff(Images,Tiles)
lc = Images(:,1);
ac = Images(:,2);
bc = Images(:,3);

lr = Tiles(:,1);
ar = Tiles(:,2);
br = Tiles(:,3);

for i = 1:3840
    for j = 1:242
        diff(j) = sqrt((lc(i)-lr(j)).^2 +(ac(i)-ar(j)).^2 +(bc(i)-br(j)).^2);
    end
    [~,index(i)] = min(diff)
end



end

