classdef CTransposeOperation < UnaryOperation
    %CTRANSPOSEOPERATION Complex conjugate transpose operation
    %   Operation used in the overload of the 'ctranspose' method
    
    methods
        function this = CTransposeOperation(operand)
            this@UnaryOperation(2, operand, @(x) x', '', '''');
        end
    end
end

