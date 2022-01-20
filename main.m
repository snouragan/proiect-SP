file = 'Teme proiect SP 421F 422F.xlsx';
n = 4;
sheet = 'Sheet1';
[a2, a1, a0] = readVariables(file, sheet, n);
t1 = linspace(0, 1);
t2 = linspace(-1, 3);
T = [0.5, 1, 2];
period = 1;
number_of_periods = [3, 37, 20, 1, 10];
s = linspace(-4, 6);
CC = [1.827839, 4.166016, 2.083008];
precision = 100000;
precision_t = linspace(0,1,precision);
pprecision = 100000;
pprecision_t = linspace(0,1,precision);
clf;

% MAIN SIGNAL
plot(t1, signal_main(a0, a1, a2, t1));
design_graph('t', 'x(t)', 'Reprezentarea grafica x(t) pe suportul [0;1]');

input('next');

plot(t2, signal_main(a0, a1, a2, t2));
design_graph('t', 'x(t)', 'Reprezentarea grafica x(t) pe suportul [-1;3]');

input('next');

% xi signal
for i = 1:2
    for j = 1:3
        name = 'x';
        signal = signal_main(a0, a1, a2, t1);
        display_signal(signal, T, j, i, name, number_of_periods, period, @signal_xi);
    end
    input('next');
end

% yi signal 
for i = 1:2
    for j = 1:3
        name = 'y';
        signal = signal_main(a0, a1, a2, t1);
        display_signal(signal, T, j, i, name, number_of_periods, period, @signal_yi);
    end
    input('next');
end

% zi signal 
for i = 1:2
    for j = 1:3
        name = 'z';
        signal = signal_main(a0, a1, a2, t1);
        display_signal(signal, T, j, i, name, number_of_periods, period, @signal_zi);
    end
    input('next');
end

% xi monoalternate number_of_periods[3] = 20 => i = 3
for j = 1:3
    name = 'x';
    signal = signal_main(a0, a1, a2, t1);
    display_mono_signal(signal, T, j, 3, name, number_of_periods, period, @signal_xi, @mono);
end

input('next');

% yi monoalternate
for j = 1:3
    name = 'y';
    signal = signal_main(a0, a1, a2, t1);
    display_mono_signal(signal, T, j, 3, name, number_of_periods, period, @signal_yi, @mono);
end

input('next');

%zi monoalternate
for j = 1:3
    name = 'z';
    signal = signal_main(a0, a1, a2, t1);
    display_mono_signal(signal, T, j, 3, name, number_of_periods, period, @signal_zi, @mono);
end

input('next');

%xi double alternate
for j = 1:3
    name = 'x';
    signal = signal_main(a0, a1, a2, t1);
    display_double_signal(signal, T, j, 3, name, number_of_periods, period, @signal_xi, @double_);
end

input('next');

% yi double alternate
for j = 1:3
    name = 'y';
    signal = signal_main(a0, a1, a2, t1);
    display_double_signal(signal, T, j, 3, name, number_of_periods, period, @signal_yi, @double_);
end

input('next');

%zi double alternate
for j = 1:3
    name = 'z';
    signal = signal_main(a0, a1, a2, t1);
    display_double_signal(signal, T, j, 3, name, number_of_periods, period, @signal_zi, @double_);
end

input('next');

% x par => a1 = 0
subplot(2, 1, 1);
plot(s, signal_second(a0, 0, a2, s));
design_graph('t', 'x(t)', 'Reprezentarea grafica xpar(t)');

% x impar => a2 = 0  a1 = -a1  a0 = 0
subplot(2, 1, 2);
plot(s, signal_second(0, -a1, 0, s));
design_graph('t', 'x(t)', 'Reprezentarea grafica ximpar(t)');

input('next');
clf;

% x(2t)
subplot(3, 1, 1);
plot(s, signal_second(a0, a1, a2, 2*s));
design_graph('t', 'x(t)', 'Reprezentarea grafica x(2t)');

% x(2t-1)
subplot(3, 1, 2);
plot(s, signal_second(a0, a1, a2, (2*s -1)));
design_graph('t', 'x(t)', 'Reprezentarea grafica x(2t - 1)');

% x(t/2)
subplot(3, 1, 3);
plot(s, signal_second(a0, a1, a2, s/2));
design_graph('t', 'x(t)', 'Reprezentarea grafica x(t/2)');

input('next');
clf;

% x^2(t)
subplot(3, 1, 1);
plot(s, signal_second(a0, a1, a2, s) .^ 2);
design_graph('t', 'x(t)', 'Reprezentarea grafica x^2(t)');

% x^2(2t)
subplot(3, 1, 2);
plot(s, signal_second(a0, a1, a2, 2 * s) .^ 2);
design_graph('t', 'x(t)', 'Reprezentarea grafica x^2(2t)');

% x(sqrt(abs(2t)))
subplot(3, 1, 3);
plot(s, sqrt(abs(signal_second(a0, a1, a2, s))));
design_graph('t', 'x(t)', 'Reprezentarea grafica sqrt(x(t))');

input('next');
clf;

% xi - CC
for i = 4:5
    for j = 1:3
        name = 'x';
        signal = signal_main(a0, a1, a2, t1);
        display_signal_nocc(signal, T, j, i, name, number_of_periods, period, @signal_xi, CC);
    end
    input('next');
end

% cc: precision = 10^5
for i = 1:3
    disp(cc(signal_main(a0, a1, a2, precision_t), precision, T(i)));
end

input('next');

% pt: precision = 10^4
for i = 1:3
    disp(calculate_power(signal_main(a0, a1, a2, pprecision_t), pprecision, T(i)));
end

input('next');
clf;

% w1(t)
syms t;
tw1 = [n-4, n+12];
w1 = @(t) n*heaviside(t-n) - (n-17)*heaviside(t-n-4) + (2*n+15)*heaviside(t-n-7) - (30+2*n)*heaviside(t-n-9) - 2*heaviside(t-n-10);
fplot(w1(t), tw1);
y_label = 'w1(t)';
title_ = 'Reprezentarea grafica w1(t)';
design_graph('t', y_label, title_);

input('next');
clf;

% w2(t)
syms t;
tw2 = [-2, 11];
w2 = @(t) t*heaviside(t) + (n*t-20)*heaviside(t-2) - (n-10)*heaviside(t-5) - (n*t-10)*heaviside(t-7);
fplot(w2(t), tw2);
y_label = 'w2(t)';
title_ = 'Reprezentarea grafica w2(t)';
design_graph('t', y_label, title_);

input('next');
clf;

% w3(t)
syms t;
tw3 = [-n, 6*n];
w3 = @(t) 5*heaviside(t-n) - 9*((t-3*n)/n)*(heaviside(t-2*n)-heaviside(t-3*n)) + 9*(1+(2*n-t)/n)*(heaviside(t-3*n)-heaviside(t-4*n)) - 5*heaviside(t-5*n);
fplot(w3(t), tw3);
y_label = 'w3(t)';
title_ = 'Reprezentarea grafica w3(t)';
design_graph('t', y_label, title_);

input('next');