% Makes an image of points that can be added or removed by clicking
% Input: I(Cut imace), 
%   points(markedspots), 
%   Im(Cut Image with original colors), 
%   Orig(full original image) 
% Output: points(modified by user)

function points = modifypoints( points, Orig)
str = 'n';
while str == 'n'
disp('Left click to add. Right click to remove')

[s, ~, button] = ginput;
add = [];
for i = 1:length(s)
    for n = 1:length(points)
        if points(n) == round(s(i))
            if button(i) == 3
                points(n) = []; 
                break; 
            end
        end
        if  button(i)== 1 
            add = [add, s(i)]; 
            break;
        end
    end
end

for i = 1:length(add)
    points(length(points)+1) = round(add(i));
end
points = sort(points, 2);

drawpoints( points, Orig);
prompt= 'Done? y/n \n';
str = input(prompt, 's');

end

end