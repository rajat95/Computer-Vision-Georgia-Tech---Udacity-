function [out] = pyramid(img,levels)
    gaussian_pyramids = cell(1,levels+1);
    gaussian_pyramids{1} = img;
    temp = img;
    for i = 2:levels
        gaussian_pyramids{i} = reduce(temp);
        temp =  gaussian_pyramids{i};
    end
    out = cell(1,length(gaussian_pyramids ));
    for i = 1:length(gaussian_pyramids)-1
        [r,c] = size(gaussian_pyramids{i});
        temp = expand(gaussian_pyramids{i+1});
        temp = temp(1:r,1:c,:);
        out{i} = gaussian_pyramids{i}-temp;
    end
    out{length(out)-1} = gaussian_pyramids{length(gaussian_pyramids)-1};
end