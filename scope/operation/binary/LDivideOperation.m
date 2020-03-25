classdef LDivideOperation < BinaryOperation
    %LDIVIDEOPERATION Left element-wise division operation
    %   Operation used in the overload of the 'ldivide' method
    
    methods
        function this = LDivideOperation(operandOne, operandTwo)
            this@BinaryOperation(5, operandOne, operandTwo, @(x, y) x .\ y, '', ' .\ ', '');
        end
    end
end

