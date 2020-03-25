classdef ArrayIndexingOperation < BinaryOperation
    %ARRAYINDEXINGOPERATION Array indexing operation
    %   Operation used in the overload of the 'subsref' method with array
    %   indexing as argument
    
    methods
        function this = ArrayIndexingOperation(operandOne, operandTwo)
            this@BinaryOperation(1, operandOne, operandTwo, @(x, y) x(y), '', '(', ')');
        end
    end
end

