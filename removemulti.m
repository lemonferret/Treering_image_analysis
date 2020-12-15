% Removes the peaks that are not separated by valleys and valleys not separated by peaks 
% Input: pks(peaks), ploc(locations of peaks), vks(valleys), vloc(locations of valleys), cut(threshold-line) 
% Output: uni(marks -1 for valley and +1 for peaks), place(locations of uni)

function [uni, place] = removemulti(pks, ploc, vks, vloc)

tp = zeros([length(pks)])+1;
tv = zeros(length(vks))-1;
tv = tv(1, :);
tp = tp(1, :);

comb = [[tv', vloc']; [tp', ploc']];
comb = sortrows(comb, 2);

n = 1;
for i = 1:length(comb)-1
    if comb(i, 1) ~=  comb(i+1, 1);
        unique(n, :) = comb(i, :);
        n = n+1;
    end 
    
end

if unique(end, :) ~= comb(end, :)
    unique(n, :) = comb(end, :);
end
uni = unique(:, 1)';
place = unique(:, 2)';

end

% Valitsee suurimman piikin sen sikjaan että valitsee viimeisen
