function [H, theta, rho] = hough_lines_acc(BW, varargin)
    % Compute Hough accumulator array for finding lines.
    %
    % BW: Binary (black and white) image containing edge pixels
    % RhoResolution (optional): Difference between successive rho values, in pixels
    % Theta (optional): Vector of theta values to use, in degrees
    %
    % Please see the Matlab documentation for hough():
    % http://www.mathworks.com/help/images/ref/hough.html
    % Your code should imitate the Matlab implementation.
    %
    % Pay close attention to the coordinate system specified in the assignment.
    % Note: Rows of H should correspond to values of rho, columns those of theta.

    %% Parse input arguments
    p = inputParser();
    p.addParamValue( 'RhoResolution', 1.5);
    p.addParamValue('Theta', linspace(-90, 89, 180));
    parse(p, varargin{:});

    rhoStep = p.Results.RhoResolution;
    Theta = p.Results.Theta;
    theta = Theta;
    %% TODO: Your code here
    
    [m,n] = size(BW);
    H(1:180,1:n) = 0;
    rho(1:180,1:n) = 0;
    for i = 1:m
        for j = 1:n
            if BW(i,j) ~= 0
                for k = Theta
                    r = j*sind(k)+i*cosd(k);
                    rho(k+91,int16(n/2+r/((sqrt(m*m+n*n)*2/n*rhoStep)))) = r;
                    H(k+91,int16(n/2+r/((sqrt(m*m+n*n)*2/n*rhoStep)))) =    H(k+91,int16(n/2+r/((sqrt(m*m+n*n)*2/n*rhoStep)))) +1;
                end
            end
        end
    end
    

                    
end
