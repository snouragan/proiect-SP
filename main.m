file = 'Teme proiect SP 421F 422F.xlsx';
number = 4;
sheet = 'Sheet1';
[a2, a1, a0] = readVariables(file, sheet, number);
t1 = linspace(0, 1);
t2 = linspace(-1, 3);
T = [0.5, 1, 2];

% MAIN SIGNAL
plot(signal_main(a0, a1, a2, t1));
plot(signal_main(a0, a1, a2, t2));

% 3 periods
% SIGNAL xi i= 1 3

main_signal_period = 1;
