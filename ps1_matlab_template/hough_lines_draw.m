function hough_lines_draw(img, outfile, peaks, rho, theta)
    % Draw lines found in an image using Hough transform.
    %
    % img: Image on top of which to draw lines
    % outfile: Output image filename to save plot as
    % peaks: Qx2 matrix containing row, column indices of the Q peaks found in accumulator
    % rho: Vector of rho values, in pixels
    % theta: Vector of theta values, in degrees

    % TODO: Your code here
    num_peaks = size(peaks,1);
    figure;
    hold on;
    imshow(img);
    [m,n] = size(img);
    x = 1:n;
    for i = 1:num_peaks
        if (abs((peaks(i,1))) <= 91&&abs((peaks(i,1))) >= 89)
            x = ones(1,n).*cosd((peaks(i,1))).*rho(peaks(i,1)+91,peaks(i,2));
            y = 1:m;
        else
            x = 1:n;
            y = (rho(peaks(i,1)+91,peaks(i,2))-x*sind(peaks(i,1)))/cosd(peaks(i,1));
        end
        line(x,y,'Color','g','LineWidth',2);
%         a = sind(peaks(i,1));
%         b = cosd(peaks(i,1));
%         x0 = a*rho(peaks(i,1)+91,peaks(i,2));
%         y0 = b*rho(peaks(i,1)+91,peaks(i,2));
%         pt1 = int16(x0+1000*(-b)): int16(y0+1000*(a));
%         pt2 = int16(x0-1000*(-b)): int16(y0-1000*(a));
%         line(pt1,pt2,'Color','g','LineWidth',2);
    end
  
    %imwrite(img, fullfile('G:\ps1_matlab_template\output\', outfile));  % save as output/ps1-1-a-1.png
    hold off
end
