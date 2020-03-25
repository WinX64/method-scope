classdef OrOperation < BinaryOperation
    %OROPERATION Logical OR operation
    %   Operation used in the overload of the 'or' method
    
    methods
        function this = OrOperation(operandOne, operandTwo)
            this@BinaryOperation(10, operandOne, operandTwo, @(x, y) x | y, '', ' | ', '');
        end
    end
end

