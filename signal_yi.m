function [yi, si] = signal_yi(x, T, number_of_periods, period)
% return signal yi
yi = x'*ones(period, period * number_of_periods);
for i=1:number_of_periods
    for j=1:100
        yi(j,i)=((-1)^i)*yi(j,i);
        if T > period
            if j > 100 * period/T
                yi(j,i) = 0;
            end
        end
    end
end
yi = yi(:);
si = linspace(0, T * number_of_periods, 100 * number_of_periods);
si = si(:);
end