function [xi, si] = signal_xi(x, T, number_of_periods, period)
% return signal xi 
xi = x'*ones(period, period * number_of_periods);
xi = xi(:);
si = linspace(0, T * number_of_periods, 100 * number_of_periods);
si = si(:);
end

