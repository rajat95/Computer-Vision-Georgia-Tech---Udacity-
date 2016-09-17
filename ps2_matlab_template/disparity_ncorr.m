function D = disparity_ncorr(L, R)
    % Compute disparity map D(y, x) such that: L(y, x) = R(y, x + D(y, x))
    %
    % L: Grayscale left image
    % R: Grayscale right image, same size as L
    % D: Output disparity map, same size as L, R

    % TODO: Your code here
    win_size = 5
    [m,n] = size(L);
    D = zeros(m+win_size+1,n+win_size+1);
    L = padarray(L,[win_size win_size],0);
    R = padarray(R,[win_size win_size],0);
    for i = win_size+1:m
        A = R(i-win_size:i+win_size,:);
        for j = win_size+1:n
            i,j
            template = L(i-win_size:i+win_size,j-win_size:j+win_size);
            res = normxcorr2(template,A);
            [val,index] = max(res(2*win_size+1,:));
            D(i,j) = index-j-win_size;
        end
       
    end
    D
    D = D(win_size+1:m,win_size+1:n); 
end
