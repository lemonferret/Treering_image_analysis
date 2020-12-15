%Rotates and crops the image
% Input: I(Image)
% Output: Ic(Cropped Image)

function Ic = crop(filename)

I = imread(filename);
imshow(I);
disp('Choose axis by clicking on center first')
[x,y] = ginput(2);
y1 = round(y(1));
x1 = round(x(1));
y2 = round(y(2));
x2 = round(x(2));


adj = abs(y1-y2);
hyp = sqrt(abs(y1-y2)^2+abs(x1-x2)^2);

angle = acosd(adj/hyp);
if x2 <= x1 && y2 <= y1
    Ic = imrotate(I, -angle);    
elseif x2 <= x1 && y2 > y1
    Ic = imrotate(I, angle+180);
elseif x2 > x1 && y2 <= y1
    Ic =  imrotate(I, angle);
else 
    Ic =  imrotate(I, 180-angle);
end

imshow(Ic);
disp('Choose start and end point')
[x,y] = ginput(2);



Ic = imcrop(Ic, [x(1)-25, y(2), 50, abs(y(1)-y(2))]);
close(gcf);
figure(2);
imshow(Ic);
imwrite(Ic, [filename(1:end-4)  '1.png'])
end
