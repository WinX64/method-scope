classdef PlusOperation < BinaryOperation
    %PLUSOPERATION Binary addition operation
    %   Operation used in the overload of the 'plus' method
    
    methods
        function this = PlusOperation(operandOne, operandTwo)
            this@BinaryOperation(6, operandOne, operandTwo, @(x, y) x + y, '', ' + ', '');
        end
    end
end

