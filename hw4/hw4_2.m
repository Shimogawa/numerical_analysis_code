%% Problem 2

A = [2 1   2  2;
     1 -7  6  5;
     2 6   2 -5;
     2 5  -5  1];

%% Householder

x = A(2:4,1);
v1 = x - sign(x(1))*sqrt(x'*x)*[1,0,0]';
v = [0;v1];
H = eye(4) - 2/(v'*v)*v*v';
A1 = H*A*H';

% next step
x = A1(3:4,2);
v1 = x - sign(x(1))*sqrt(x'*x)*[1,0]';
v = [0;0;v1];
H = eye(4) - 2/(v'*v)*v*v';
A2 = H*A1*H';

%% plane/Givens rotations:

% rotate in 4-3 plane:
x4=A(4,1);
x3=A(3,1);
r = sqrt(x3^2+x4^2);
c = x3/r;
s = x4/r;

% do rotation from left:
A(3:4,:) = [c s; -s c]*A(3:4,:);

% do rotation from right:
A(:,3:4) = A(:,3:4)*[c s; -s c]';

% rotate in 3-2 plane:
x3=A(3,1); x2=A(2,1);
r = sqrt(x2^2+x3^2);
c = x2/r;
s = x3/r;

% do rotation from left:
A(2:3,:) = [c s; -s c]*A(2:3,:);

% do rotation from right:
A(:,2:3) = A(:,2:3)*[c s; -s c]';

% rotate in 4-3 plane:
x4=A(4,2);
x3=A(3,2);
r = sqrt(x3^2+x4^2);
c = x3/r;
s = x4/r;

% do rotation from left:
A(3:4,:) = [c s; -s c]*A(3:4,:);

% do rotation from right:
A(:,3:4) = A(:,3:4)*[c s; -s c]';