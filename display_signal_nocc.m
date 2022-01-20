function [] = display_signal_nocc(signal, T, j, i, name, number_of_periods, period, signal_i, CC)
[xi, si] = signal_i(signal, T(j), number_of_periods(i), period);
subplot(3, 1, j);
plot(si, xi - CC(j));
y_label = name + string(j) + '(t)';
title_ = 'Reprezentarea grafica ' + y_label + 'fara C0 pe ' + string(number_of_periods(i)) + ' perioade';
design_graph('t', y_label, title_);
end