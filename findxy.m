function findxy(I);

I = permute(I,  [2 1 3 ]);
dim = size(I);
n = 1;
I2 = rgb2gray(I);
 
for i = 1:dim(1)
    for j = 1:dim(2)
      if  I(i,j,1) > 200 &&  I(i,j,2) < 100 && I(i,j,3) < 100        
        I(i, j, :) = [0 255 0];
        points(:,  n) = [i j];
        I2(i, j) = -2 
        n = n+1;
        end
    end
end

ax1 = subplot(1, 1, 1);
imagesc(I2);
map = [[ 0 0 1 ]; gray; [  1 1 1 ]];
colormap(ax1, map);

points = points'
id = fopen('Coordinates1.txt', 'w+');

for i =1:length(points(:, 1))
    fprintf(id, '%d %d %d \n', points(i, 2),   points(i, 1), 0 );
end
fclose(id);


end