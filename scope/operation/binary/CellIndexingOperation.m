classdef CellIndexingOperation < BinaryOperation
    %CELLINDEXINGOPERATION Cell indexing operation
    %   Operation used in the overload of the 'subsref' method with cell
    %   indexing as argument
    
    methods
        function this = CellIndexingOperation(operandOne, operandTwo)
            this@BinaryOperation(1, operandOne, operandTwo, @(x, y) x{y}, '', '{', '}');
        end
    end
end

