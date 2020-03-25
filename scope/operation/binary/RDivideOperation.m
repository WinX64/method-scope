classdef RDivideOperation < BinaryOperation
    %RDIVIDEOPERATION Right element-wise division operation
    %   Operation used in the overload of the 'rdivide' method
    
    methods
        function this = RDivideOperation(operandOne, operandTwo)
            this@BinaryOperation(5, operandOne, operandTwo, @(x, y) x ./ y, '', ' ./ ', '');
        end
    end
end

