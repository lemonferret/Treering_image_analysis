% Removes the peaks and valleys that are over 0.01 above or beyond the cut-line. 
% Input: pks(peaks), ploc(locations of peaks), vks(valleys), vloc(locations of valleys), cut(threshold-line) 
% Output: pksf(peaks), plocf(locations of peaks), vksf(valleys), vlocf(locations of valleys),

function [pksf, plocf vksf, vlocf] = removemiddle(pks, ploc, vks, vloc, cut)

% remove peaks too low
n = 1;
for i = 1:length(pks)
    if pks(i) > cut(ploc(i))+0.02;
        pksf(n) = pks(i);
        plocf(n) = ploc(i);  
        n = n+1;
    end
end

% remove valleys too high

n = 1;
for i = 1:length(vks)
    if vks(i) < cut(vloc(i))-0.02;
        vksf(n) = vks(i);
        vlocf(n) = vloc(i);  
        n = n+1;
    end
end
end