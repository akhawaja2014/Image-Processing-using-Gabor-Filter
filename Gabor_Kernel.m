function kernel = Gabor_Kernel(size,lambda,theta,psi,sigma,gamma)
% Yunke Li,MSCV 1
% Return a size*size gabor kernel
%   The size should be odd

%   lambda represents the wavelength of the sinusoidal factor
%   theta represents the orientation of the normal to the parallel stripes of a Gabor function
%   psi represents the phase offset
%   sigma represents sigma/standard deviation of the Gaussian function
%   gamma represents spatial aspect ratio, and specifies the ellipticity of the support of the Gabor function


range = linspace(-(size-1)/2,(size-1)/2,size);
[x_index,y_index] = meshgrid(range,-range);          % calculate x-coordinate and y-coordinate of each element
xp =  x_index * cos(theta) + y_index * sin(theta);   % x prime
yp = -x_index * sin(theta) + y_index * cos(theta);   % y prime
kernel = exp(-(xp.^2 + gamma^2 * yp.^2)/(2 * sigma^2)) .* exp (1i * (2 * pi * xp / lambda + psi));
end

