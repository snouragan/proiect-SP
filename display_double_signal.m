function [] = display_double_signal(signal, T, j, i, name, number_of_periods, period, signal_i, double)
[xi, si] = signal_i(signal, T(j), number_of_periods(i), period);
xi = double(xi, si);
subplot(3, 1, j);
plot(si, xi);
y_label = name + string(j) + '(t)';
title_ = 'Reprezentarea grafica dubla alternanta ' + y_label + ' pe ' + string(number_of_periods(i)) + ' perioade';
design_graph('t', y_label, title_);
end