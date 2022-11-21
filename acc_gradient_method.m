function [initial_theta,norm_grad] = acc_gradient_method(X,initial_theta,y_class,lambda)
    iter = 1;
    norm_grad = zeros(100,1);
    [J,grad] = lrCostFunction(initial_theta,X,y_class,lambda);
    aux = initial_theta;
    while norm(grad)>=1e-3
        arg = @(alpha)lrCostFunction(initial_theta-alpha*grad,X,y_class,lambda);
        alpha = fminbnd(arg,0,1);
        norm_grad(iter) = norm(grad);
        if iter > 100
            disp('S-a atins nr maxim de iteratii!');
            break;
        end
        initial_theta = aux - alpha*grad;
        aux = initial_theta + alpha*(initial_theta - aux);
        iter = iter +1;
        [J,grad] = lrCostFunction(initial_theta,X,y_class,lambda);
    end
    figure
    plot(norm_grad);
    title('Metoda Gradient Accelerat');
    xlabel('Nr iteratii');
    ylabel('Norm(gradient)');
end