% ps1

%% 1-a
% img = imread(fullfile('G:\ps1_matlab_template\input\', 'ps1-input0.png'));  % already grayscale
% %% TODO: Compute edge image img_edges
% img_edges = edge(img,'prewitt');
% 
% imshow(img_edges);
% imwrite(img_edges, fullfile('G:\ps1_matlab_template\output\', 'ps1-1-a-1.png'));  % save as output/ps1-1-a-1.png
% 
% %% 2-a
% [H, theta, rho] = hough_lines_acc(img_edges);  % defined in hough_lines_acc.m
% %% TODO: Plot/show accumulator array H, save as output/ps1-2-a-1.png
% imshow(uint8(H));
% %% 2-b
% peaks = hough_peaks(H,6);  % defined in hough_peaks.m
% %% TODO: Highlight peak locations on accumulator array, save as output/ps1-2-b-1.png
% hough_lines_draw(img,'ps1-2-b-1.png' , peaks, rho, theta);
%% TODO: Rest of your code here
img = rgb2gray(imread(fullfile('G:\ps1_matlab_template\input\', 'ps1-input1.png')));  % already grayscale
imshow(img);
%%img = imgaussfilt(img,2);
[img_edges,thresh] = edge(img,'Canny',[],4);
imshow(img_edges);
[H, theta, rho] = hough_lines_acc(img_edges);
peaks = hough_peaks(H,4);  % defined in hough_peaks.m
%% TODO: Highlight peak locations on accumulator array, save as output/ps1-2-b-1.png
hough_lines_draw(img,'ps1-2-b-1.png' , peaks, rho, theta);