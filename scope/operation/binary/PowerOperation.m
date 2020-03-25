classdef PowerOperation < BinaryOperation
    %POWEROPERATION Element-wise power operation
    %   Operation used in the overload of the 'power' method
    
    methods
        function this = PowerOperation(operandOne, operandTwo)
            this@BinaryOperation(2, operandOne, operandTwo, @(x, y) x .^ y, '', '.^', '');
        end
    end
end

