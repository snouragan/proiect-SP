function [mono_signal] = mono(x, s)
for i=1:1:length(s)
    if (x(i)<0)
        x(i)=0;
    end
end
mono_signal = x;
end

