function [H, v] = computeHouseholder(x)
    householder = @(a) eye(length(a)) - 2 * a * a' / (a' * a);
    if sign(x(1)) ~= 0
        c = sign(x(1)) * sqrt(x' * x);
    else
        c = sqrt(x' * x);
    end
    e = zeros(length(x), 1);
    e(1) = 1;
    v = x + c * e;
    H = householder(v);
end

