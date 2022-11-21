function [initial_theta,norm_grad] = gradient_method(X,initial_theta,y_class,lambda)
    iter = 1;
    norm_grad = zeros(100,1);
    [J,grad] = lrCostFunction(initial_theta,X,y_class,lambda);
    while norm(grad)>=1e-4
        arg = @(alpha)lrCostFunction(initial_theta-alpha*grad,X,y_class,lambda);
        alpha = fminbnd(arg,0,1);
        norm_grad(iter) = norm(grad);
        if iter > 100
            disp('S-a atins nr maxim de iteratii!');
            break;
        end
        initial_theta = initial_theta - alpha*grad;
        iter = iter +1;
        [J,grad] = lrCostFunction(initial_theta,X,y_class,lambda);
    end
    figure
    plot(norm_grad);
    title('Metoda Gradient');
    xlabel('Nr iteratii');
    ylabel('Norm(gradient)');
end