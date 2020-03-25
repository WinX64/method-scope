classdef MTimesOperation < BinaryOperation
    %MTIMESOPERATION Matrix multiplication operation
    %   Operation used in the overload of the 'mtimes' method
    
    methods
        function this = MTimesOperation(operandOne, operandTwo)
            this@BinaryOperation(5, operandOne, operandTwo, @(x, y) x * y, '', ' * ', '');
        end
    end
end

