classdef TransposeOperation < UnaryOperation
    %TRANSPOSEOPERATION Matrix transpose operation
    %   Operation used in the overload of the 'transpose' method
    
    methods
        function this = TransposeOperation(operand)
            this@UnaryOperation(2, operand, @(x) x.', '', '.''');
        end
    end
end

