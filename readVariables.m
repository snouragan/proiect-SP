function [a2, a1, a0] = readVariables(file, sheet, number)
table = readtable(file, 'Sheet', sheet);
variable_table = table(number,2:4);
a2 = str2double(variable_table.a2);
a1 = str2double(variable_table.a1);
a0 = variable_table.a0;
end
