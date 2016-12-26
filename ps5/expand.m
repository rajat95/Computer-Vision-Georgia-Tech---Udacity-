function [out] = expand(img)
    [rows,cols] = size(img);
    out = zeros([2*rows 2*cols 3]);
    out(1:2:2*rows,1:2:2*cols,:) = img;
    G = fspecial('gaussian',[5 5],1.0);
    out = imfilter(out,G);
    out = 4*out;
end