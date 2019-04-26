function range_table = pmap_to_rangetable(p_map)
    %PMAP_TO_RANGE_TABLE convert {symbol,prob} to {symbol,interval}
    % pmap is containers.map of p_map[prob] = prob
    % prob is scalar probability of symbol
    % Output is continers.map range_table[symbol] = interval 
    % interval is interval(low,high)
symbols = sort(keys(p_map));

% Find the ranges for each table
low = 0; high = 0;
ranges = cell(length(symbols),1);
i = 1;
for s=cell2mat(symbols)
    low = high;
    high = low + p_map(s);
    ranges(i) = {interval(low, high)};
    i = i+1;
end

% Generate the map
range_table = containers.Map(symbols, ranges);

end