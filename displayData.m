function displayData(sel)
    [n,~] = size(sel);
    for i = 1:n
        x = sel(i,:);
        x = reshape(x,20,20);
        subplot(abs(sqrt(n)),abs(sqrt(n)),i);
        if (abs(sqrt(n))==1)
            img = imresize(x, [60,60]);
            imshow(img');
            return;
        end
        imshow(x');
    end
end