classdef GEOperation < BinaryOperation
    %GEOPERATION 'Greater than or equal to' operation
    %   Operation used in the overload of the 'ge' method
    
    methods
        function this = GEOperation(operandOne, operandTwo)
            this@BinaryOperation(8, operandOne, operandTwo, @(x, y) x >= y, '', ' >= ', '');
        end
    end
end

