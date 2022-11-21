function [all_theta] = oneVsAll(X,y,num_labels,lambda)
    m = size(X,1); % 3410 training examples / caracters
    n = size(X,2); % 400 features of a caracter (20x20 pixels image)

    all_theta = zeros(num_labels,n+1);
    X = [ones(m,1) X];
    initial_theta = zeros(n+1,1);

    options = optimset('GradObj','on','MaxIter',100);
    for i = 1:num_labels
        i
        y_class = (y == i);
        all_theta(i,:) = fminunc(@(t)(lrCostFunction(t,X,y_class,lambda)),initial_theta,options);
%         [all_theta(i,:),norm_grad] = gradient_method(X,initial_theta,y_class,lambda);
%         [all_theta(i,:),norm_grad] = acc_gradient_method(X,initial_theta,y_class,lambda);
    end
end