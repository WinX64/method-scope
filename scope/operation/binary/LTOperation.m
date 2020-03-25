classdef LTOperation < BinaryOperation
    %LTOPERATION 'Less than' operation
    %   Operation used in the overload of the 'lt' method
    
    methods
        function this = LTOperation(operandOne, operandTwo)
            this@BinaryOperation(8, operandOne, operandTwo, @(x, y) x < y, '', ' < ', '');
        end
    end
end

