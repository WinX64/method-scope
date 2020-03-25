classdef EQOperation < BinaryOperation
    %EQOPERATION Equality operation
    %   Operation used in the overload of the 'eq' method
    
    methods
        function this = EQOperation(operandOne, operandTwo)
            this@BinaryOperation(8, operandOne, operandTwo, @(x, y) x == y, '', ' == ', '');
        end
    end
end

