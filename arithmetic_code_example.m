% Arithmetic encoding/decoding example using longer messages
% Chris Hemingway 2019
clc; clear all;

% Add high precision float library to support longer messages
% _much_ slower than using double, but "unlimited" precision
% You can uncomment this line and functions will detect and work without
% TODO: Fix arithmetic_encode.m to round down hpf as much as possible
addpath(fullfile(userpath, 'HighPrecisionFloat'));

% A message this long needs HighPrecisionFloat to work
% Longer messages seem to run into difficulties still
% Maybe arithmetic_table.m is to blame?
% FIXME: Spaces in messages don't work! Why?
message = "Hello_world_a_long_message";
%message = "h";

% Encode the message
fprintf("Encoding message %s \n", message);
range_table = arithmetic_table(message);
code = arithmetic_encode(message, range_table);


fprintf("Coding Table \n");
print_range_table(range_table);

format long
fprintf("Encoded to = ");
disp(code);
format short

% Decode the message
[decoded, debug_table] = arithmetic_decode(code, range_table);
fprintf("Decoding message %f = %s \n", code, decoded);

% Show table
display(debug_table);
