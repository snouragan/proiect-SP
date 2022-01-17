function [x] = signal_main(a0, a1, a2, t)
% return the main signal
x = a2*(t.^2) + a1 * t + a0;
x(t<0 | t>1) = 0;
end

