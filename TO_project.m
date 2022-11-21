close all;
clear all;
clc;
load('Variable.mat');
m = size(X,1);
rand_indices = randperm(m);
sel = X(rand_indices(1:10),:);
y1 = y(rand_indices(1:10));
% displayData(sel);

%training
num_labels = 62;
lambda = 0.1;
[all_theta] = oneVsAll(X,y,num_labels,lambda);

%prediction
pred = predictOneVsAll(all_theta,sel);
% fprintf('\nTraining set accuracy: %f',mean(double(pred==y1)*100));

%testing with 10 random examples
for i = 1:size(sel,1)
    displayData(sel(i,:))
    if (pred(i)==62)
        pred(i)=0;
    end
    if (pred(i)>=10 && pred(i)<36)
        fprintf('\nThe character is predicted as %c\n',char(pred(i)+55));
    end
    if (pred(i)>=36)
        fprintf('\nThe character is predicted as %c\n',char(pred(i)+61));
    end
    if (pred(i)<10)
        fprintf('\nThe character is predicted as %i\n',pred(i));
    end
    pause;
end