classdef LEOperation < BinaryOperation
    %LEOPERATION 'Less than or equal to' operation
    %   Operation used in the overload of the 'le' method
    
    methods
        function this = LEOperation(operandOne, operandTwo)
            this@BinaryOperation(8, operandOne, operandTwo, @(x, y) x <= y, '', ' <= ', '');
        end
    end
end

