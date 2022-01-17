file = 'Teme proiect SP 421F 422F.xlsx';
number = 4;
sheet = 'Sheet1';
[a2, a1, a0] = readVariables(file, sheet, number);
t1 = linspace(0, 1);
t2 = linspace(-1, 3);
T = [0.5, 1, 2];
period = 1;
number_of_periods = [3, 37];

% MAIN SIGNAL
plot(t1, signal_main(a0, a1, a2, t1));
design_graph('t', 'x(t)', 'Reprezentarea grafica x(t)');

input('next');

plot(t2, signal_main(a0, a1, a2, t2));
design_graph('t', 'x(t)', 'Reprezentarea grafica x(t)');

input('next');

% yi signal
for i = 1:2
    for j = 1:3
        [xi, si] = signal_xi(signal_main(a0, a1, a2, t1), T(j), number_of_periods(i), period);
        subplot(3, 1, j);
        plot(si, xi);
        x_label = 'x' + string(j) + '(t)';
        title_ = 'Reprezentarea grafica ' + x_label + ' pe ' + string(number_of_periods(i)) + ' perioade';
        design_graph(x_label, 't', title_);
    end
    input('next');
end

% yi signal signal


