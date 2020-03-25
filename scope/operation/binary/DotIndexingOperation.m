classdef DotIndexingOperation < BinaryOperation
    %DOTINDEXINGOPERATION Dot indexing operation
    %   Operation used in the overload of the 'subsref' method with dot
    %   indexing as argument
    
    methods
        function this = DotIndexingOperation(operandOne, operandTwo)
            this@BinaryOperation(1, operandOne, operandTwo, @(x, y) x.(y), '', '.', '');
        end
    end
end

