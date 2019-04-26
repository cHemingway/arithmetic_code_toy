function range_table = pmap_to_rangetable(p_map)
    % Convert pmap to range table
    % Sort the symbols, to match examples etc, not actually needed
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