file = 'Teme proiect SP 421F 422F.xlsx';
number = 4;
sheet = 'Sheet1';
[a2, a1, a0] = readVariables(file, sheet, number);
t1 = linspace(0, 1);
t2 = linspace(-1, 3);
T = [0.5, 1, 2];
period = 1;
number_of_periods = [3, 37, 20];
s = linspace(-4, 6);
CC = 37778.11145;

% MAIN SIGNAL
plot(t1, signal_main(a0, a1, a2, t1));
design_graph('t', 'x(t)', 'Reprezentarea grafica x(t)');

input('next');

plot(t2, signal_main(a0, a1, a2, t2));
design_graph('t', 'x(t)', 'Reprezentarea grafica x(t)');

input('next');

% xi signal
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

% yi signal 
for i = 1:2
    for j = 1:3
        [yi, si] = signal_yi(signal_main(a0, a1, a2, t1), T(j), number_of_periods(i), period);
        subplot(3, 1, j);
        plot(si, yi);
        x_label = 'y' + string(j) + '(t)';
        title_ = 'Reprezentarea grafica ' + x_label + ' pe ' + string(number_of_periods(i)) + ' perioade';
        design_graph(x_label, 't', title_);
    end
    input('next');
end

% zi signal 
for i = 1:2
    for j = 1:3
        [zi, si] = signal_zi(signal_main(a0, a1, a2, t1), T(j), number_of_periods(i), period);
        subplot(3, 1, j);
        plot(si, zi);
        x_label = 'z' + string(j) + '(t)';
        title_ = 'Reprezentarea grafica ' + x_label + ' pe ' + string(number_of_periods(i)) + ' perioade';
        design_graph(x_label, 't', title_);
    end
    input('next');
end

% xi monoalternate
for j = 1:3
    [xi, si] = signal_xi(signal_main(a0, a1, a2, t1), T(j), number_of_periods(3), period);
    xi = mono(xi, si);
    subplot(3, 1, j);
    plot(si, xi);
    x_label = 'x' + string(j) + '(t)';
    title_ = 'Reprezentarea grafica ' + x_label + 'monoalternanta';
    design_graph(x_label, 't', title_);
end

input('next');

% yi monoalternate
for j = 1:3
    [yi, si] = signal_yi(signal_main(a0, a1, a2, t1), T(j), number_of_periods(3), period);
    yi = mono(yi, si);
    subplot(3, 1, j);
    plot(si, yi);
    x_label = 'y' + string(j) + '(t)';
    title_ = 'Reprezentarea grafica ' + x_label + 'monoalternanta';
    design_graph(x_label, 't', title_);
end

input('next');

%zi monoalternate
for j = 1:3
    [zi, si] = signal_zi(signal_main(a0, a1, a2, t1), T(j), number_of_periods(3), period);
    zi = mono(zi, si);
    subplot(3, 1, j);
    plot(si, zi);
    x_label = 'z' + string(j) + '(t)';
    title_ = 'Reprezentarea grafica ' + x_label + 'monoalternanta';
    design_graph(x_label, 't', title_);
end

input('next');

%xi double alternate
for j = 1:3
    [xi, si] = signal_xi(signal_main(a0, a1, a2, t1), T(j), number_of_periods(3), period);
    xi = double_(xi, si);
    subplot(3, 1, j);
    plot(si, xi);
    x_label = 'x' + string(j) + '(t)';
    title_ = 'Reprezentarea grafica ' + x_label + 'dubla alternanta';
    design_graph(x_label, 't', title_);
end
input('next');

% yi monoalternate
for j = 1:3
    [yi, si] = signal_yi(signal_main(a0, a1, a2, t1), T(j), number_of_periods(3), period);
    yi = double_(yi, si);
    subplot(3, 1, j);
    plot(si, yi);
    x_label = 'y' + string(j) + '(t)';
    title_ = 'Reprezentarea grafica ' + x_label + 'dubla alternanta';
    design_graph(x_label, 't', title_);
end

input('next');

%zi monoalternate
for j = 1:3
    [zi, si] = signal_zi(signal_main(a0, a1, a2, t1), T(j), number_of_periods(3), period);
    zi = double_(zi, si);
    subplot(3, 1, j);
    plot(si, zi);
    x_label = 'z' + string(j) + '(t)';
    title_ = 'Reprezentarea grafica ' + x_label + 'dubla alternanta';
    design_graph(x_label, 't', title_);
end

input('next');

% x par
% plot(s, (signal_even(signal_main(a0, a1, a2, s), s)));
% design_graph('t', 'x(t)', 'Reprezentarea grafica x(t)' + 'par');
% 
% input('next');
% 
% x impar



% x(2t)
plot(s, signal_second(a0, a1, a2, 2*s));
design_graph('t', 'x(t)', 'Reprezentarea grafica x(2t)');

input('next');

% x(2t-1)
plot(s, signal_second(a0, a1, a2, (2*s -1)));
design_graph('t', 'x(t)', 'Reprezentarea grafica x(2t - 1)');

input('next');

% x(t/2)
plot(s, signal_second(a0, a1, a2, s/2));
design_graph('t', 'x(t)', 'Reprezentarea grafica x(t/2)');

input('next');

% x^2(t)
plot(s, signal_second(a0, a1, a2, s) .^ 2);
design_graph('t', 'x(t)', 'Reprezentarea grafica x^2(t)');

input('next');

% x^2(2t)
plot(s, signal_second(a0, a1, a2, 2 * s) .^ 2);
design_graph('t', 'x(t)', 'Reprezentarea grafica x^2(2t)');

input('next');

% x(2t)
plot(s, sqrt(abs(signal_second(a0, a1, a2, s))));
design_graph('t', 'x(t)', 'Reprezentarea grafica sqrt(x(t))');

input('next');

