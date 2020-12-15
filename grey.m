% Writes a file of the dark and white areas in the picture
% Input: I(Cropped image), II(Original image)

function grey(I, II)
% I = mod, II = original;
n = 5;
lim = 1; %n/2; 
cutb = 0;%-0.10;%-0.05;
smoothing = 0.9;
calibration = 60/1070;

%Start
II = permute(II, [2 1 3]);
%II = flip(II,2);

s = size(I);
I = imcrop(I, [s(2)/2-n,  0, 2*n, s(1)]);

I = rgb2gray(I);
I = I';
%I = flip(I,2);
I = imadjust(I);
I = im2double(I);


f = figure(10001);
movegui(f,'northeast');
hold on;

par =  I(1, :);
for k = 2:size(I)
    par = par + I(k, :);
end

par = par/k;
par = ((par - min(par)) / ( max(par) - min(par) ));
%par = ((par - min(par)) / ( max(par) - min(par) )*3)-1;
%par(par >= 1) = 1;
%par(par <= 0) = 0;

%for k = 1:size(I)
%par = par(74:end)
for k = 1:1

%for k = 3:size(I)-2
%par =  I(k-2, :)/5+ I(k-1, :)/5+ I(k, :)/5 +I(k+1, :)/5 + I(k+2, :)/5;

%figure(1230)
%f = abs(fft(par))
%plot(par);


%-[b a] = butter(5, 0.5, 'low');
%H = freqz(b, a, floor(numbins))
%-fil = filter(b, a, par);
%hold on; 
%-plot(fil);
%-par = fil;

%-L = diff(par, 1);
%-[b a] = butter(5, 0.07, 'low');
%-L = filter(b, a, L);
%-L = L/max(L)+1;

%-par = L/2;

%-f = figure(10001);
%-movegui(f,'northeast');
%-hold on;

% Smooth
smooth = fit([1:length(par)]', par', 'smoothingspline', 'Smoothingparam', smoothing);
smooth = feval(smooth, [1:length(par)]);
plot(smooth);

%Find light and dark areas
[pks, ploc] = findpeaks(smooth);
[vks, vloc] = findpeaks(0-smooth);
vks = abs(vks);
dd = 30;

%cut = fit( [1:length(smooth)]', smooth,  'poly1' );
%cut = feval(cut, [1:length(par)])+cutb;

cut = lsq_lut_piecewise( [1:length(smooth)]', smooth, [1:dd: length(smooth)] )+cutb;
cut = fit(([1:length(cut)]*dd-dd)', cut, 'smoothingspline', 'Smoothingparam', 1);
cut = feval(cut, [1:length(par)]);

%cut([1:length(smooth)]) = 0.5; 

plot([1:length(cut)], cut);


[pks, ploc, vks, vloc] = removemiddle(pks, ploc, vks, vloc, cut);
[uni, place] = removemulti(pks, ploc, vks, vloc); % remove excess marks
smooth= setborders(cut, place, uni, smooth);

%Add to figure
plot(ploc, pks, 'Or');
plot(vloc, vks, 'Ok');
ylim([0 1]);

new(k, :) = smooth;
%figure(123123)
%plot(par)
%hold on;
%plot(L)

end

%figure(123123123)
%imagesc(new);
%map = [[ 1 0 0]; gray ;[0  1 0];];
%colormap(map)

points = limits(I, new, lim);
%drawpoints(I, points, Im, II);
drawpoints(points, II);

points = modifypoints( points, II);

points = points*calibration; %calibration
points = round(points/0.0025)*0.0025;
maketable_points(points);


end




