function p = predictOneVsAll(all_theta,X)
    m = size(X,1); % 3410 training examples
    num_labels = size(all_theta,1);  %nr of classes

    p = zeros(size(X,1),1);  %probability of each example
    X = [ones(m,1),X];

    all_theta_t = all_theta.';

    [c,p] = max(sigmoid(X*all_theta_t),[],2);
end