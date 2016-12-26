function [out] = pyramid(img,levels)
    gaussian_pyramids = cell(1,levels+1);
    gaussian_pyramids{1} = img;
    temp = img;
    for i = 2:levels+1
        gaussian_pyramids{i} = reduce(temp);
        temp =  gaussian_pyramids{i};
    end
    out = cell(1,length(gaussian_pyramids ));
    for i = 1:length(gaussian_pyramids)-1
        [r,c] = size(gaussian_pyramids{i});
        temp = expand(gaussian_pyramids{i+1});
%        size(temp)
        if(ndims(img) == 2)
            temp = temp(1:r,1:c);
        else
            temp = temp(1:r,1:c,:);
        end
        out{i} = gaussian_pyramids{i}-temp;
    end
    out{end} = gaussian_pyramids{end};
    figure
    for i = 1:levels
        subplot(1,levels,i);
        imshow(out{i});
    end
end