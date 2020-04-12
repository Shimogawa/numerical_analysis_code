%% 3b

x = [2; -1; 1];

r = sqrt(x(2)^2 + x(3)^2);
c = x(2)/r;
s = x(3)/r;

R23 = [c s; -s c];
x(2:3) = R23 * x(2:3);

r = sqrt(x(1)^2 + x(2)^2);
c = x(1)/r;
s = x(2)/r;

R12 = [c s; -s c];
x(1:2) = R12 * x(1:2);


%% 3c_1

A = [2 -6; -1 -4; 1 3];

x = A(:,1);

[H1, v1] = computeHouseholder(x);

A = H1 * A;
x = A(2:length(A), 2);
[H2_, v2_] = computeHouseholder(x);

H2 = [1 zeros(1, length(v2_));zeros(length(v2_), 1) H2_];
A = H2 * A;
R = A;
Q = H1' * H2';


%% 3c_2

A = [2 -6; -1 -4; 1 3];

x = A(:,1);
r = sqrt(x(2)^2 + x(3)^2);
c = x(2)/r;
s = x(3)/r;
R1_23 = [1 0 0; 0 c s; 0 -s c];

A = R1_23 * A;

x = A(:, 1);
r = sqrt(x(1)^2 + x(2)^2);
c = x(1)/r;
s = x(2)/r;
R1_12 = [c s 0; -s c 0; 0 0 1];
A = R1_12 * A;

x = A(:, 2);
r = sqrt(x(2)^2 + x(3)^2);
c = x(2)/r;
s = x(3)/r;
R2 = [1 0 0; 0 c s; 0 -s c];
A = R2 * A;

R = A;
Q = (R2 * R1_12 * R1_23)';
