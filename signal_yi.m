function [yi, si] = signal_yi(x, T, number_of_periods, period)
% return signal yi
yi = x'*ones(period, period * number_of_periods);
for i=1:3
    for j=1:100
        yi(j,i)=((-1)^i)*yi(j,i);
    end
end
yi = yi(:);
si = linspace(0, T * number_of_periods, 100 * number_of_periods);
si = si(:);
end