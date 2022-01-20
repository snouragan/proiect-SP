function [zi, si] = signal_zi(x, T, number_of_periods, period)
% return signal zi 
zi = x'*ones(period, period * number_of_periods);
for i=1:number_of_periods
    for j=1:100
        zi(j,i)=((-1)^(i+1))*zi(j,i);
        if T > period
            if j > 100 * period/T
                zi(j,i) = 0;
            end
        end
    end
end
zi = zi(:);
si = linspace(0, T * number_of_periods, 100 * number_of_periods);
si = si(:);
end

