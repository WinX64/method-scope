classdef Colon2Operation < BinaryOperation
    %COLON2OPERATION Binary colon operation
    %   Operation used in the overload of the 'colon' method with two
    %   arguments
    
    methods
        function this = Colon2Operation(operandOne, operandTwo)
            this@BinaryOperation(7, operandOne, operandTwo, @(x, y) x:y, '', ':', '');
        end
    end
end

