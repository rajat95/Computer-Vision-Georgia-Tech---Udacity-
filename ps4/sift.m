function [  ] = sift()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    img = imread(fullfile('G:\ps4\input\','simA.jpg'));
    [Gx,Gy] = imgradientxy(img);
    corners = harris_corner(img);
    angles = zeros(size(corners));
    F_in = zeros(4,size(corners,1));
    for i = 1:size(corners,1)
        F_in(:,i) = [corners(i,1);corners(i,2);1.0;atan2(Gx(corners(i,1),corners(i,2)),Gy(corners(i,1),corners(i,2)))];
    end
    I = single(img);
    [F_out, D_out] = vl_sift(I, 'frames', F_in);
    
    perm = randperm(size(F_out,2)) ;
    sel = perm(1:50) ;
    h1 = vl_plotframe(F_out(:,sel)) ;
    h2 = vl_plotframe(F_out(:,sel)) ;
    set(h1,'color','k','linewidth',3) ;
    set(h2,'color','b','linewidth',2) ;
    
end


