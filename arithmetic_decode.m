% Chris Hemingway 2019

function [data,debug_table] = arithmetic_decode(code, range_table, terminator)
%ARITHMETIC_DECODE decode data from given range table

debug_cells = {};

% Support custom terminator
if nargin < 3
    terminator = '$';
end

% Would convert binary code to decimal here
value = code;
    
data = [];

while true
    s = find_symbol(value, range_table);
    data = [data s]; %#ok<AGROW> %Output the symbol
    low = range_table(s).low;
    high = range_table(s).high;
   
    range = high - low;
    
    % Save for debug
    debug_cells =[debug_cells ; {double(value), s, low, high, range}];
    
    value = (value - low) / range;

    if s == terminator % Until symbol s is a terminator
        break
    end 
end

% Should we return a table? 
% Not part of algorithm, just for checking answers
if nargout==2
    variable_names = {'value', 'Symbol', 'low', 'high', 'range'};
    debug_table = cell2table(debug_cells,'VariableNames',variable_names);
end

end


function s = find_symbol(value, range_table)
%FIND_SYMBOL find symbol in range table so low <= value < high

for s = cell2mat(keys(range_table))
   low = range_table(s).low;
   high = range_table(s).high;
   if (low <= value) && (value < high)
      return; 
   end
end
error("Could not find symbol for value %d",value);
end