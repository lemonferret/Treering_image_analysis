function  maketable_points(points)


points= sort(points, 2);
id = fopen('Coordinates1.txt', 'w+');

for i =1:length(points)
fprintf(id, '%d %d %d \n', 0,  points(i), 0 );
end

fclose(id);

end