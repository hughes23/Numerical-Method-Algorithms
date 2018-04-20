function [L, U, P] = luFactor(A)
% Performs LU Factorization with partial pivoting
%   By initially pivoting matrix A and performing LU decomposition with
%   back subsitution variables x1, x2, and x3 will be calculated.
%
% - INPUTS
% A = coefficient matrix;
%
% - OUTPUTS
% L = lower triangular matrix;
% U = upper triangular matrix;
% P = the pivot matrix;

% nargin %
if nargin < 1
    disp('error - need inputs')
elseif nargin > 1
    disp('error - too many inputs')
end

% pivot column one %%
row1 = A(1,:); % pull out row one of matrix A
row2 = A(2,:); % pull out row two of matrix A
row3 = A(3,:); % pull out row three of matrix A

% find top column
if abs(row1(1,1)) >= abs(row2(1,1)) && abs(row1(1,1)) >= abs(row3(1,1))
    A1 = [row1; row2; row3];
elseif abs(row2(1,1)) >= abs(row1(1,1)) && abs(row2(1,1)) >= abs(row3(1,1))
    A1 = [row2; row1; row3];
elseif abs(row3(1,1)) >= abs(row1(1,1)) && abs(row3(1,1)) >= abs(row3(1,1))
    A1 = [row3; row1; row2];
end

% relable rows of matrix
r1 = A1(1,:);
r2 = A1(2,:);
r3 = A1(3,:);

% find bottom column
if abs(r2(1,1)) <= abs(r3(1,1))
    A2 = [r1; r3; r2];
elseif abs(r3(1,1)) <= abs(r2(1,1))
    A2 = [r1; r2; r3];
end

% eliminate first zero
l21 = A2(2,1) / A2(1,1); % 1st L matrix value
A_2 = A2(2,:) - (l21*A2(1,:)); % make U(2,1) zero

% eliminate second zero
l31 = A2(3,1) / A2(1,1); % 2nd L matrix value
A_3 = A2(3,:) - (l31*A2(1,:)); % make U(3,1) zero

A3 = [r1; A_2; A_3]; % first column's zeros

% pivot column two %%
r_1 = A3(1,:);
r_2 = A3(2,:);
r_3 = A3(3,:);

if abs(A3(2,2)) >= abs(A3(3,2))
    A3 = [r_1; r_2; r_3];
    L = [1 0 0; l21, 1 0; l31, 0, 1];
elseif abs(A3(3,2)) >= abs(A3(2,2))
    A3 = [r_1; r_3; r_2];
    L = [1 0 0; l31, 1 0; l21, 0, 1];
end

% create final zero
l32 = A3(3,2) / A3(2,2); % 3rd L matrix value
A_4 = A3(3,:) - (l32*A3(2,:)); % make U(3,2) zero

% Final U matrix
U = [r_1; A3(2,:); A_4];



% create L matrix %%
Lr1 = L(1,:);
Lr2 = L(2,:);
Lr3 = L(3,:);

L = [Lr1; Lr2; Lr3];
L(3,2) = l32; 

% Finding P through left division
P = A2/A;
P = abs(P);

end

