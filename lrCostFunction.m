function [J,grad] = lrCostFunction(theta,X,y,lambda)
    m = length(y);

    J = 0;
    grad = zeros(size(theta));

    h = sigmoid(X*theta);

    J = (-1/m) * sum(y.*log(h) + (1-y).*log(1-h)) + lambda/(2*m)*sum(theta(2:size(theta)).^2);

    grad = (1/m)*X.'*(h-y)+lambda/m*theta;
    grad(1) = grad(1) -lambda/m*theta(1);
end