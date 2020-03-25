classdef UMinusOperation < UnaryOperation
    %UMINUSOPERATION Unary minus operation
    %   Operation used in the overload of the method uminus
    
    methods
        function this = UMinusOperation(operand)
            this@UnaryOperation(4, operand, @(x) -x, '-', '');
        end
    end
end

