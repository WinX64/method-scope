classdef Colon3Operation < TernaryOperation
    %COLON3OPERATION Ternary colon operation
    %   Operation used in the overload of the 'colon' method with three
    %   arguments
    
    methods
        function this = Colon3Operation(operandOne, operandTwo, operandThree)
            this@TernaryOperation(7, operandOne, operandTwo,...
                operandThree, @(x, y, z) x:y:z, '', ':', ':', '');
        end
    end
end

