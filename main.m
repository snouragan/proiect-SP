file = 'Teme proiect SP 421F 422F.xlsx';
number = 4;
sheet = 'Sheet1';
[a2, a1, a0] = readVariables(file, sheet, number);

% MAIN SIGNAL
t = linspace(0,1);
x = a2*t.^2 + a1*t + a0;

% SIGNAL xi i = 1-3
xi = conv(x, dirac(x));
plot(1:199, xi)