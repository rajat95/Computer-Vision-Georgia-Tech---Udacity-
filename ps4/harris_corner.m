function[] = harris_corner()
    imgA = imread(fullfile('G:\ps4\input\', 'simA.jpg'));
    G = fspecial('gaussian',[1 5],2);
    imgA_x = imfilter(imgA,G);
    [Gx,temp] = imgradientxy(imgA_x);
    G =  fspecial('gaussian',[5 1],2);
    imgA_y = imfilter(imgA,G);
    [temp,Gy] = imgradientxy(imgA_y);
%    imshow(Gx);
%    imshow(Gy);
    squared_xx = Gx.*Gx;
    squared_yy = Gy.*Gy;
    squared_xy = Gx.*Gy;
    G2 = fspecial('gaussian',[7 7],2);
    squared_xx = im2double(imfilter(squared_xx,G2));
    squared_yy = im2double(imfilter(squared_yy,G2));
    squared_xy = im2double(imfilter(squared_xy,G2));
    [size_x,size_y] = size(imgA);
    R = zeros(size_x,size_y);
    for i = 1:size_x
        for j = 1:size_y
            m = [squared_xx(i,j), squared_xy(i,j);squared_xy(i,j),squared_yy(i,j)];
            R(i,j) = det(m) - (0.15*(trace(m)^2));
        end
    end

%    imagesc(R)
%    colorbar
    th = 20000;

    radius = 9;
    sze = 2*radius+1; 
    mx = ordfilt2(R,sze^2,ones(sze)); % Grey-scale dilate.
	R = (R==mx)&(R>th);       % Find maxima.
	
	[r,c] = find(R); 
    size(r)
    figure, imagesc(imgA), axis image, colormap(gray), hold on
	plot(c,r,'ys'), title('corners detected');
end