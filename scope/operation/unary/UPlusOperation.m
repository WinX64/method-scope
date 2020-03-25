classdef UPlusOperation < UnaryOperation
    %UPLUSOPERATION Unary plus operation
    %   Operation used in the overload of the method uplus
    
    methods
        function this = UPlusOperation(operand)
            this@UnaryOperation(4, operand, @(x) +x, '+', '');
        end
    end
end

