function [projection,camera_centre] = proj_matrix()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    world_pts = importdata('G:\ps3\input\pts3d.txt');
    world_pts = world_pts(1:8,:);
    camera_pts = importdata('G:\ps3\input\pts2d-pic_a.txt');
    camera_pts =  camera_pts(1:8,:);
    A = zeros(16,12);
    for m = 1:2:15
        A(m,1:3) = world_pts(ceil(m/2),:);
        A(m,4) = 1.0;
        A(m,9:11) = -1.0.*world_pts(ceil(m/2),:).*camera_pts(ceil(m/2),1);
        A(m,12) = -1.0*camera_pts(ceil(m/2),1);
        A(m+1,5:7) = world_pts(ceil(m/2),:);
        A(m+1,8) = 1.0;
        A(m+1,9:11) = -1.0.*world_pts(ceil(m/2),:).*camera_pts(ceil(m/2),2);
        A(m+1,12) = -1.0*camera_pts(ceil(m/2),2);

    end
    [U,S,V] = svd(A);
    projection = V(:,end);
%    projection
    m = (reshape(projection,4,3))';
%    m
    camera_centre = (-1.*inv(m(:,1:end-1)))*m(:,end);
    camera_centre
end

