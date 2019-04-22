% Chris Hemingway 2019

function range_table = arithmetic_table(data)
%ARITHMETIC_TABLE generate optimal range table for arithmetic coding data
%FIXME: Cannot handle strings with spaces, unsure why

if isa(data, 'string')
    data = char(data);
end

% Get the probability of each symbol in the data
p_map = probability_map(data);
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

range_table = containers.Map(symbols, ranges);

end