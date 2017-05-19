X = [1 2 3 4];
y = 5;
theta=[0.1 0.2 0.3 0.4]';
[J g] = linearRegCostFunction(X, y, theta, 7)
fprintf("-2, -2.6, -3.9, -5.2\n")

X = [[1 1 1]' magic(3)];
y = [7 6 5]';
theta = [0.1 0.2 0.3 0.4]';
[J g] = linearRegCostFunction(X, y, theta, 0)
fprintf("-1.4, -8.73, -4.3, -7.93\n")

[J g] = linearRegCostFunction(X, y, theta, 7)
fprintf("-1.4, -8.26, -3.63, -7\n")