function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.1;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%


Cvalues = [] ;%[0.75 1 1.5];
sigmavalues = [] ;%[0.05 0.1 0.2];
error_min = 10000;
f = fopen('results.txt', 'at');
for i = 1:length(Cvalues) 
	Cval = Cvalues(i);
	for j = 1:length(sigmavalues)
		sigmaval = sigmavalues(j);
		model = svmTrain(X, y, Cval, @(x1, x2) gaussianKernel(x1, x2, sigmaval));
		predictions = svmPredict(model, Xval);
		error = mean(double(predictions ~= yval));
		fprintf('C %f, sigma %f, error %f\n', Cval, sigmaval, error);
		if error < error_min
			error_min = error;
			C = Cval;
			sigma = sigmaval;
			
			fprintf(f, 'C %f, sigma %f, error %f\n', C, sigma, error);
		end
	end
end

fprintf('Final C %f, sigma %f, error %f\n', C, sigma, error_min);
fprintf(f, 'Final C %f, sigma %f, error %f\n', C, sigma, error_min);
fclose(f);
% =========================================================================

end
