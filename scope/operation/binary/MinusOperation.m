classdef MinusOperation < BinaryOperation
    %MINUSOPERATION Binary subtraction operation
    %   Operation used in the overload of the 'minus' method
    
    methods
        function this = MinusOperation(operandOne, operandTwo)
            this@BinaryOperation(6, operandOne, operandTwo, @(x, y) x - y, '', ' - ', '');
        end
    end
end

