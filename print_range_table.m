% Chris Hemingway 2019

function print_range_table(range_table)
    symbols = keys(range_table);
    v = values(range_table);
    % Convert ranges to struct array
    ranges = vertcat(v{:});
    
    % Create table, transpose data as need to be per row
    names = {'symbol', 'low', 'high'};
    t = table(symbols', [ranges.low]', [ranges.high]', ...
        'VariableNames', names);
    disp(t);
end