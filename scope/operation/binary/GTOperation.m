classdef GTOperation < BinaryOperation
    %GTOPERATION 'Greater than' operation
    %   Operation used in the overload of the 'gt' method
    
    methods
        function this = GTOperation(operandOne, operandTwo)
            this@BinaryOperation(8, operandOne, operandTwo, @(x, y) x > y, '', ' > ', '');
        end
    end
end

