classdef NEOperation < BinaryOperation
    %NEOPERATION Inequality operation
    %   Operation used in the overload of the 'ne' method
    
    methods
        function this = NEOperation(operandOne, operandTwo)
            this@BinaryOperation(8, operandOne, operandTwo, @(x, y) x ~= y, '', ' ~= ', '');
        end
    end
end

