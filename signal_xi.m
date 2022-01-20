function [xi, si] = signal_xi(x, T, number_of_periods, period)
% return signal xi 
if T > period
    for i = 1:100 * T
        if i > 100 * (T - period)
            x(i) = 0;
        end
    end
end
xi = x'*ones(period, period * number_of_periods);
xi = xi(:);   
if T > period
    si = linspace(0, T * number_of_periods, 100 * number_of_periods * T);
else
    si = linspace(0, T * number_of_periods, 100 * number_of_periods);
end
    si = si(:);
end

