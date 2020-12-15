% Marks start(-2) and end(+2) of valleys in the line of imagedata 
% Input: cut(threshold-line),  place(locations of uni), uni(marks -1 for valley and +1 for peaks), par(a line of image data) 
% Output: par(line of imagedata)

function [par] = setborders(cut, place, uni, par)
s = 1;

for i = 1:length(place)
    n = place(i);
    if uni(i) == -1
    while par(n) < cut(n)
        n = n-1;
        if n == 1
            break;
        end
    end
        n = n+1;
        valleyborleft(s) = n; 
    while par(n) < cut(n)
        n = n+1;
        if n > length(par)
            break;
        end
    end 
        valleyborright(s) = n-1; 
       
        if valleyborright(s) == valleyborleft(s);
         valleyborleft(s) = valleyborleft(s)-1;  
        end
        s = s+1; 
        %if valleyborright(s) ~= valleyborleft(s); 
        %s = s+1;
        %end
    end
    
end

%clean borders

par(valleyborleft) = -2;
par(valleyborright) = 2;


%figure(14);
%imagesc(par');
%map = [[ 1 0 0]; gray ;[0  1 0];];
%colormap(map)
