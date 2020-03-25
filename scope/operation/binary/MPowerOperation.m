classdef MPowerOperation < BinaryOperation
    %MPOWEROPERATION Matrix power operation
    %   Operation used in the overload of the 'mpower' method
    
    methods
        function this = MPowerOperation(operandOne, operandTwo)
            this@BinaryOperation(2, operandOne, operandTwo, @(x, y) x ^ y, '', '^', '');
        end
    end
end

