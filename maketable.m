function  maketable(I)

figure(1);
I = permute(I,  [2 1 3 ]);

imshow(I);
set(gca, 'YDir', 'normal');


[x,y] = ginput;
close;
t = zeros(size(x));

x = round(x)*0.001;
y = round(y)*0.001;


id = fopen('Coordinates.txt', 'w+');
 
for i =1:size(x)
fprintf(id, '%d %d %d \n', x(i), y(i), t(i) );
end

fclose(id);

end