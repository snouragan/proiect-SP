function [pt] = calculate_power(x, precision, T)
area = 0;
for i = 1:precision
    area = area + (x(i).^2); 
end
pt = (1 / T) * area * (1/precision);
end

