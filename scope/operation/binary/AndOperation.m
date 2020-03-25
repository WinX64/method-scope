classdef AndOperation < BinaryOperation
    %ANDOPERATION Logical AND operation
    %   Operation used in the overload of the 'and' method
    
    methods
        function this = AndOperation(operandOne, operandTwo)
            this@BinaryOperation(9, operandOne, operandTwo, @(x, y) x & y, '', ' & ', '');
        end
    end
end

