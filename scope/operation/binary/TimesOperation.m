classdef TimesOperation < BinaryOperation
    %TIMESOPERATION Element-wise multiplication operation
    %   Operation used in the overload of the 'times' method
    
    methods
        function this = TimesOperation(operandOne, operandTwo)
            this@BinaryOperation(5, operandOne, operandTwo, @(x, y) x .* y, '', ' .* ', '');
        end
    end
end

