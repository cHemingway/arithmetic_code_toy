## A Toy Arithmetic Encoder in MATLAB

Written to be easy to understand and use, but not suitable for anything serious at all.

Encodes/decodes strings/chars to/from floating point numbers, attempting to round the number to the shortest length possible for "compression". 

Uses `$` symbol as string terminator.

Optionally uses the [HPF library](https://uk.mathworks.com/matlabcentral/fileexchange/36534-hpf-a-big-decimal-class) by  John D'Errico to support messages longer than 10 chars or so. To use this, simply add this library to your MATLAB directory (e.g. `My Documents/MATLAB`) and it will be detected automatically.

### Known Issues
- Does not support spaces in text yet.

### TODO
- [ ] Round high precision floats properly.
- [ ] Convert to/from fixed point binary vectors e.g. `[1 0 1 1]` as this is needed for real use and communications toolkit usage.