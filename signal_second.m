function [x] = signal_second(a0, a1, a2, t)
% return the main signal
x = a2*(t.^2) + a1 * t + a0;
end

