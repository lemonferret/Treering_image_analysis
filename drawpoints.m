% Shows an image with marked spots and the original below it 
% Input: I(Cut imace), points(spots to be marked), 
%   Im(Cut Image with original colors), 
%   Orig(full original image) 


function drawpoints( points, Orig )
%k = round(length(I(:,1))/2);


%for i = 1:length(I(k, :))
%   for s = 1:length(points)
%       if points(s) == i
%           I(k, i) = -2;
%       end
%   end
%end

%I(1,1) = 2;
%figure(101);

%ax1 = subplot(2, 1, 1);
%imagesc(I);
%map = [[ 0 0 1 ]; gray; [  0 0 0 ]];
%colormap(ax1, map);

%ax2 = subplot(2, 1, 2);

%set(hFig, 'Position', [50 50 300 500]);

%Im = permute(Im, [2 1 3]);
%imagesc(Im);
%image(Im);
%map2 = [jet];
%colormap(ax2, map2);


kn =  round(length(Orig(:,1))/2);
%points = round(points*3131/140);

Orig(Orig <= 10) = 11;
figure(101);
Origi = Orig;
Orig = rgb2gray(Orig);

for i = 1:length(Orig(kn, :))
    for s = 1:length(points);
        if points(s) == i
            for d = kn-5:kn+5
            Orig(d, i) = -2;
            %Orig(d, i-1) = -2;
            %Orig(d, i+1) = -2;
            %Orig(d, i-2) = -2;
            %Orig(d, i+2) = -2;
            %Orig(kn-d, i) = -2;
            %Orig(kn+d, i) = -2;
            end
        end
    end
end


Orig(1,1) = -2;

ax1 = subplot(2, 1, 1);
%Orig = permute(Orig, [2 1 3]);
imagesc(Orig);
map = [[ 1 0 0 ]; gray; [  1 1 1 ]];
colormap(ax1, map);

ax2 = subplot(2, 1, 2);

%set(hFig, 'Position', [50 50 300 500]);

%Origi = permute(Origi, [2 1 3]);
imagesc(Origi);

end 





