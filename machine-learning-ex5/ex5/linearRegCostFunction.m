function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%


h = (X*theta) - y;
h = h.^2;
J = (sum(h)/(2*m));
J += ((lambda*sum((theta(2:end,:).^2)))/(2*m));

hTheta=X*theta;

for theta_var = 2:rows(theta)
	grad(theta_var,1) = (1/m)*sum((hTheta - y).*X(:,theta_var)) + (lambda/m)*theta(theta_var,1);
end

grad(1,1) = (1/m)*sum((hTheta - y).*X(:,1));





% =========================================================================

grad = grad(:);

end