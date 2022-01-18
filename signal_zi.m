function [zi, si] = signal_zi(x, T, number_of_periods, period)
% return signal xi 
zi = x'*ones(period, period * number_of_periods);
for i=1:3
    for j=1:100
        zi(j,i)=((-1)^(i+1))*zi(j,i);
    end
end
zi = zi(:);
si = linspace(0, T * number_of_periods, 100 * number_of_periods);
si = si(:);
end

