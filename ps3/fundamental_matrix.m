function [ fun_matrix ] = fundamental_matrix()
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    img1_pts = importdata('G:\ps3\input\pts2d-pic_a.txt');
    img1_pts = img1_pts(1:20,:);
    img2_pts = importdata('G:\ps3\input\pts2d-pic_b.txt');
    img2_pts =  img2_pts(1:20,:);
    mat = [img1_pts(1,1)*img2_pts(1,1),img1_pts(1,1)*img2_pts(1,2),img1_pts(1,1),img1_pts(1,2)*img2_pts(1,1),img1_pts(1,2)*img2_pts(1,2),img1_pts(1,2),img2_pts(1,1),img2_pts(1,2),1.000];
    for i = 2:20
        mat = [mat;img1_pts(i,1)*img2_pts(i,1),img1_pts(i,1)*img2_pts(i,2),img1_pts(i,1),img1_pts(i,2)*img2_pts(i,1),img1_pts(i,2)*img2_pts(i,2),img1_pts(i,2),img2_pts(i,1),img2_pts(i,2),1.000];
    end
   [U,S,V] = svd(mat);
   m = V(:,end);
   m = (reshape(m,3,3))';
   [U,S,V] = svd(m);
   S(3,3) = 0;
   fun_matrix = U*S*V';
end

