function [out] = reduce(img)
    G = fspecial('gaussian',[5 5],1.0);
    img = imfilter(img,G);
    rows = size(img,1);
    cols = size(img,2);
    temp = img(1:2:rows,:,:);
    out = temp(:,1:2:cols,:);
end