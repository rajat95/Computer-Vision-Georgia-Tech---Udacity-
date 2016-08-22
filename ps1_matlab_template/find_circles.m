function [centers, radii] = find_circles(BW, radius_range)
    % Find circles in given radius range using Hough transform.
    %
    % BW: Binary (black and white) image containing edge pixels
    % radius_range: Range of circle radii [min max] to look for, in pixels

    % TODO: Your code here
    centers = [];
    radii = [];
    for r = radius_range(0):radius_range(1)
        H = hough_circles_acc(BW,r);
        peaks = hough_peaks_circles(H,2);
        centers = [centres;peaks];
        radii = [radii;r];
    end
     
end
