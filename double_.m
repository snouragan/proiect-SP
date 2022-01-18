function [double_signal] = double_(x, s)
for i=1:1:length(s)
    if (x(i)<0)
        x(i)=-x(i);
    end
end
double_signal = x;
end
