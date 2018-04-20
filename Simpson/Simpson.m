function [I] = Simpson(x,y)
% Applies a combination of Simpson's 1/3 Rule to the inputted matrix 
% to output an approximation of the integral
%   Input
%   - y = interesting information
%   - x = corresponding time values 
%
%   Output
%   - I = integral approximation

x = x';
y = y';

% make sure the inputted matrixs are the same size
c = length(x);
c1 = length(y);

if c ~= c1
    error('inputted matrixs have different sizes')
end

% takes difference of every term and selects the 1st term in matrix d
d = diff(x);
d1_1 = d(1);
d1_2 = d(2);

% creates new matrix (Z1) w/ the same size but has 1st term throughout
Length = length(d);
Z = ones(Length,1);
Z1 = d1_1*Z;
Z2 = d1_2*Z;

% if loop checks if d has the same interval throughout
ans1 = all(d(:) == Z1(:));
if ans1 == 0
    error('intervals are not evenly spaced')
end

ans1 = all(d(:) == Z2(:));
if ans1 == 0
    error('intervals are not evenly spaced')
end

% determine in trapezoid estimation will take place
trap = length(d);
trap = rem(trap,2);
if trap == 1
    disp('The area of the last interval will be calculated through trapezoid rule.')
end

% Simpson's 1/3
dr4 = 0;
dr2 = 0;

for i = 2:2:Length
    dr4 = dr4 + 4*y(i);
end

for i = 3:2:Length-1
    dr2 = dr2 + 2*y(i);
end

Simp = ((x(2)-x(1))/3)*(y(1) + dr4 + dr2 + y(Length));

% Trapezoid Rule
if trap == 1
    trap = (x(2)-x(1))*((y(Length)+y(Length+1))/2);
end

I = Simp + trap;

end

