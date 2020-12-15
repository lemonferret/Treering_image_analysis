function p=  flipc(y, I)

y= [1, y, length(I(1, :))];
const = 0;%6.78;

dif(1) = y(1);
for i = 1:length(y)-1
    dif(i+1) = y(i+1)-y(i);
end

dif= flip(dif);
new(1) = const;

for i = 1:length(dif)
    new(i+1) = new(i)+dif(i);
end
p = new(2:end);

end
