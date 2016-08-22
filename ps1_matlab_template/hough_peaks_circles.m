function peaks = hough_peaks_circles(H, varargin)
    % Find peaks in a Hough accumulator array.
    %
    % Threshold (optional): Threshold at which values of H are considered to be peaks
    % NHoodSize (optional): Size of the suppression neighborhood, [M N]
    %
    % Please see the Matlab documentation for houghpeaks():
    % http://www.mathworks.com/help/images/ref/houghpeaks.html
    % Your code should imitate the matlab implementation.

    %% Parse input arguments
    p = inputParser;
    p.addOptional( 'numpeaks', 1, @isnumeric);
    p.addParamValue('Threshold', 0.55 * max(H(:)));
    p.addParamValue('NHoodSize', floor(size(H) / 100.0) * 2 + 1);  % odd values >= size(H)/50
    parse(p, varargin{:});
    
    numpeaks = p.Results.numpeaks;
    threshold = p.Results.Threshold;
    nHoodSize = p.Results.NHoodSize;

    % TODO: Your code here
    peaks = [];
    for i = 1:numpeaks
        [peak,idx] = max(H(:));
        if peak<=threshold
            break;
        end
        [m,n] = ind2sub(size(H),idx);
        [x,y] = size(H);
        peaks = [peaks ;[m,n]];
        for j = -1*nHoodSize(1)/2:nHoodSize(1)/2
            if(int16(m+j)>0&&int16(m+j)<=x)
                H(int16(m+j),n) = 0;
            end
        end
        for j = -1*nHoodSize(2)/2:nHoodSize(2)/2
            if(int16(n+j)>0&&int16(n+j)<=y)
               H(m,int16(n+j)) = 0;
            end
        end
    end
    
end