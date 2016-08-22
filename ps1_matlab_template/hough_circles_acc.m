function H = hough_circles_acc(BW, radius)
    % Compute Hough accumulator array for finding circles.
    %
    % BW: Binary (black and white) image containing edge pixels
    % radius: Radius of circles to look for, in pixels

    % TODO: Your code here
    [m,n] = imsize(BW);
    H(1:n,1:m) = 0;
    for i = 1:n
        for j = 1:m
            if BW(i,j) ~= 0
                for k = 0:360
                    x0 = round(i-(radius*cosd(k)));
                    y0 = round(j-(radius*cosd(k)));
                    if x0<=n && x0>0 && y0<=m && y0>0
                        H(x0,y0) =  H(x0,y0)+1; 
                    end
                end
            end
        end
    end
    
end
