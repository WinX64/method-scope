# MethodScope

A tool to extract arithmetic operations from P-encoded MATLAB files.

## Description

MethodScope is an utility tool able to scope simple MATLAB arithmetic functions and recreate their inner workings. It can be passed as argument into mathematical functions and the output will contain detailed information about the equations utilized to generate said output.

This process is performed via operator overloading on the custom class `MethodScope.m`, which logs all arithmetic, logical and indexing operations done with itself. These operations are then used to construct a tree of operations, which can be later converted into equations dependent on the input given to the function file.

This tool proves useful for cases were you desire to know the equations that govern the behavior of, for example, a space-state system that is encoded in a S-function P-file. The tool can be applied to the section that updates derivatives in order to extract that information from the encrypted file, and rebuild the equations.

## Limitations

Since operations need to be done with at least an instance of the scope, this tool cannot:
* Log method calls that require explicitly numerical values, such as `sin` and `cos`.
* Log operations that are done without its own instance, such as an addition or subtraction between two numerical constants.

## How to use

An example of how to use the tool can be found [here](example).

## Contributing

Feel free to open a pull request if you have any improvement or fix to propose, and it will be reviewed as soon as possible.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
