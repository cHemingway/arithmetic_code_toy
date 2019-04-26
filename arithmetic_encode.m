% Chris Hemingway 2019

function code = arithmetic_encode(data, range_table, terminator)
%ARITHMETIC_ENCODE encode data with given range table

% Convert to character array so we can support strings.
% Not part of algorithm, but allows double quotes e.g. "abc" and 'abc'
data = char(data);

if nargin < 3 % Were we given custom string termination?
    terminator = '$';
end

% Terminate if not done, not part of algorithm, but would be needed
if data(end) ~= terminator
   data(end+1) = terminator; 
end

if exist('hpf')
    low = hpf(0.0); high=hpf(1.0); range=hpf(1.0);
else
    low = 0.0; high = 1.0; range = 1.0;
end
for c = data
   high = low + range * range_table(c).high;
   low = low + range * range_table(c).low;
   range = high - low;
end
code = output_code(low, high);
end


function code = output_code(low, high)
% Output a code by taking the midpoint and rounding as much as we can
% TODO, Do something more clever here, like minimise number of bits needed

if exist('hpf')
    low = hpf(low);
    high = hpf(high);
    mid = (high-low)/2 + low;
    code = mid;
    return;
    
    % TODO FIX THIS
    dp = mid.NumberOfDigits; % Starting number of decimal places
    rounded = mid;
    while ((low <= rounded) &&  (rounded < high)) && dp(2) > 1 % Round until its wrong
        dp(1) = dp(1) - 1;
        dp(2) = ceil(dp(1) / 5);
        rounded = augmentdigits(rounded, dp);
    end
    dp(1) = dp(1) + 1;
    dp(2) = dp(1) * 5;
    code = augmentdigits(mid, dp);
else
    low = double(low);
    high = double(high);
    mid = (high-low)/2 + low; % Get midpoint
    dp = 20; % Starting number of decimal places
    rounded = mid;
    while ((low <= rounded) &&  (rounded < high)) % Round until its wrong
        dp = dp - 1;
        rounded = round(rounded, dp);
    end
    code = round(mid, dp+1);
end
end