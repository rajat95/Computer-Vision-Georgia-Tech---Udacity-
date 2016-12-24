function[ ] = lucas_kanade()
    img1 = im2double(imread(fullfile('G:\ps5\input\TestSeq','shift0.png')));
    img2 =  im2double(imread(fullfile('G:\ps5\input\TestSeq','shiftR2.png')));
    G = fspecial('gaussian',[5 5],1.5);
    img1 = imfilter(img1,G);
    img2 = imfilter(img2,G);
    diff = img2-img1;
    [gx,gy] = imgradientxy(img1);
    gx = im2double(gx);
    gy = im2double(gy);
    gx_sq = gx.*gx;
    gy_sq = gy.*gy;
    g_xy = gx.*gy;
    filter = ones(5,5);
    prod_x = -1.0*gx.*diff;
    prod_y = -1.0*gy.*diff;
    val1 = im2double(imfilter(gx_sq,filter));
    val2 = im2double(imfilter(g_xy,filter));
    val3 = val2;
    val4 = im2double(imfilter(gy_sq,filter));
    val5 = im2double(imfilter(prod_x,filter));
    val6 = im2double(imfilter(prod_y,filter));
    [m,n] = size(img1);
    x_disp = zeros(m,n);
    y_disp = zeros(m,n);
    for i = 1:m
        for j = 1:n
            disp = pinv([val1(i,j),val2(i,j);val3(i,j),val4(i,j)])*[val5(i,j);val6(i,j)];
            x_disp(i,j) = disp(1);
            y_disp(i,j) = disp(2);
        end
    end
    min(min(x_disp))
    figure
    subplot(2,1,1)
    imagesc(abs(x_disp),[0,10])
    colormap jet
    colorbar
    title('x_comp')

    subplot(2,1,2)
    imagesc(abs(y_disp),[0,10])
    colormap jet
    colorbar
    title('y_comp')
end
