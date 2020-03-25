classdef NotOperation < UnaryOperation
    %NOTOPERATION Logical NOT operation
    %   Operation used in the overload of the 'not' method
    
    methods
        function this = NotOperation(operand)
            this@UnaryOperation(4, operand, @(x) ~x, '~', '');
        end
    end
end

