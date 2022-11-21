clear all;
close all;
clc;
load("data.mat")
imds = imageDatastore('C:\Users\neagu\OneDrive\Desktop\TO_project_research\Img');
imgs = readall(imds);
[n,~] = size(imgs);
X = zeros(n,400);
for i=1:n
    img = cell2mat(imgs(i));
    img = rgb2gray(img);
    img = imresize(img, [20,20]);
    img = im2double(img);
    img = img';
    X(i,:) = img(:)';
end
y = table2array(data(:,2));

save('Variable.mat','y','X');