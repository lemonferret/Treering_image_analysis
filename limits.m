% Finds most likely border position by summing all   
% Input: I(Cut imace), new(Image with marked borders), 
%   Im(Cut Image with original colors), 
%   lim(how many hits required for separate border), 
%   Orig(full original image) 
% Output: par(line of imagedata)


function points = limits(I, new, lim)

sumred = zeros(length(new(1,:)), 1);
sumred = sumred(:, 1);
sumgreen = zeros(length(new(1,:)));
sumgreen = sumgreen(:, 1);

for k = 1:size(new)

%a = size(new);
%par = new(round(a(1)/2), :);
par = new(k, :);

for i = 1:length(par)
if  par(i) == -2
sumred(i) = sumred(i) +1;
end
if  par(i) == 2
sumgreen(i) = sumgreen(i) +1;
end

end
end

[pks, ploc] = findpeaks([0; sumred]);
[pks2, ploc2] = findpeaks([0; sumgreen]);
ploc = ploc-1;
ploc2 = ploc2-1;
make = 1;
if ploc2(1) < ploc(1)
    make = 0;
end    

n = 1;
for i = 1:length(pks)
    if pks(i) >= lim 
        pksr(n) = pks(i);
        plocr(n) = ploc(i);
        n = n+1;
    end
end
n = 1;
if make == 0
[pksg(n), plocg(n)] = max(sumgreen(1:plocr(1)));
plocg(n) = plocg(n) + 1;
n = n+1;
end
for i = 1:length(plocr)-1 
[pksg(n), plocg(n)] = max(sumgreen(plocr(i):plocr(i+1)));

plocg(n) = plocg(n) + plocr(i);
n = n+1;
end
if make == 1
[pksg(n), plocg(n)] = max(sumgreen(plocr(i+1):end));
plocg(n) = plocg(n) + plocr(i+1);
end

%figure(666)
%plot(sumred)
%hold on
%plot(sumgreen)
%plot(plocr, pksr, 'Or');
%plot(plocg, pksg, 'Og');

%remove the sames 
try;
n = 1;
for i = 1:length(plocg)
if plocg(i) > plocr(i)
    placeg(n) = plocg(i);
    placer(n) = plocr(i);
    pskgt(n) = pksg(i);
    pskrt(n) = pksr(i);
    n = n+1;
end
end
plocg = placeg;
plocr = placer;
pksg = pskgt;
pksr = pskrt;
catch
    ;
end



%figure(666)
%plot(sumred)
%hold on
%plot(sumgreen)
%plot(plocr, pksr, 'Or');
%plot(plocg, pksg, 'Og');

points = round((plocg+plocr)/2);

plocrw = [plocr(2: end)];
plocgw = [plocg(1:end-1)];

if make == 1
    points2 = [round(1+plocr(1))/2, round((plocgw+plocrw)/2)];
else
points2 = round((plocgw+plocrw)/2);    
end



points = [points, points2];
%drawpoints(I, points, Im, Orig)

end

