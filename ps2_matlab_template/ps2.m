% ps2

%% 1-a
% Read images
h = fspecial('gaussian',5,3);
%use rgb2gray for color images
L = im2double(imsharpen((imread(fullfile('G:\ps2_matlab_template\input\', 'pair0-L.png')))));
R = im2double(imsharpen((imread(fullfile('G:\ps2_matlab_template\input\', 'pair0-R.png')))));
% Compute disparity
%D_L = disparity_ncorr(L, R);
D_R = disparity_ncorr(R, L);
D_R = imadjust(mat2gray(D_R));
imshow(D_R);
