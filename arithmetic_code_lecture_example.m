% Arithmetic encoding/decoding example from EEE8098 lectures
% Chris Hemingway 2019


clc; clear all;

% Decode the exact value given in the notes
symbols = {'A', 'B', 'C', 'D', 'E', 'F', '$'};
intervals = {
interval(0, 0.2)
interval(0.2, 0.3)
interval(0.3, 0.5)
interval(0.5, 0.55)
interval(0.55, 0.85)
interval(0.85, 0.9)
interval(0.9, 1.0)
};
range_table = containers.Map(symbols, intervals);

code = 0.33203125;
[decoded, debug_table] = arithmetic_decode(code, range_table);
fprintf("Decoding message %d = %s \n", code, decoded);

% Show table, increase number of decimal places
display(debug_table);