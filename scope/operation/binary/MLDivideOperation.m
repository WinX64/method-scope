classdef MLDivideOperation < BinaryOperation
    %MLDIVIDEOPERATION Left matrix division operation
    %   Operation used in the overload of the 'mldivide' method
    
    methods
        function this = MLDivideOperation(operandOne, operandTwo)
            this@BinaryOperation(5, operandOne, operandTwo, @(x, y) x \ y, '', ' \ ', '');
        end
    end
end

