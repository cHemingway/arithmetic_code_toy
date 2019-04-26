% Chris Hemingway 2019

function range_table = arithmetic_table(data)
%ARITHMETIC_TABLE generate optimal range table for arithmetic coding data
%FIXME: Cannot handle strings with spaces, unsure why

if isa(data, 'string')
    data = char(data);
end

% Get the probability of each symbol in the data
p_map = probability_map(data);

% Convert to range table
range_table = pmap_to_rangetable(pmap);
end