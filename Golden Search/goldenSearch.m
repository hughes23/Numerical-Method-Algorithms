function [ min ] = goldenSearch(f, xL, xR)
%UNTITLED2 Summary of this function goes here
% f is a function
% xl is the left point
% xr is the right
% check args
% given: f(x), xL, xR
% solve x1, x2
% solve f(xL), f(xR), f(x1), f(x2)
% replace either xl or xr to decrease the interval we are checking
phi = (1+sqrt(5))/2;
es = 0.001;
max_iter = 10;
iter = 0;
ea = es*10;
while (ea > es) && (iter < max_iter)
    d = (phi-1)*(xR-xL);
    x1 = xL+d;
    x2 = xR-d;
    % plot points
    x = linspace(-1,1);
    figure
    hold on
    plot(x, f(x))
    plot(xL, f(xL),'o', xR, f(xR), 'o')
    plot(x1, f(x1),'o', x2, f(x2), 'o')
    %
    if (f(x1) < f(x2)) % get rid of xR
        xL = x2;
        xopt = x1;
    else % get rid of xL
        xR = x1;
        xopt = x2;
    end
    iter = iter+1;
    if (xopt ~= 0)
        ea = (2-phi)*abs((xR-xL)/xopt)*100);
    end
end
min = xopt;
end
