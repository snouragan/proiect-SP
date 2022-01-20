function [cc] = cc(x, precision, T)
area = 0;
for i = 1:precision
    area = area + x(i); 
end
cc = (1 / T) * area * (1/precision);
end

