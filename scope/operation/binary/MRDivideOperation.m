classdef MRDivideOperation < BinaryOperation
    %MRDIVIDEOPERATION Matrix right division operation
    %   Operation used in the overload of the 'mrdivide' method
    
    methods
        function this = MRDivideOperation(operandOne, operandTwo)
            this@BinaryOperation(5, operandOne, operandTwo, @(x, y) x / y, '', ' / ', '');
        end
    end
end

