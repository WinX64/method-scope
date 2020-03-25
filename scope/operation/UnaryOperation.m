classdef (Abstract) UnaryOperation < Operation
    %UNARYOPERATION Unary operations
    %   Base class for operations with a single value
    
    properties
        Children %The one child node of the operation
    end
    
    properties (Access = private)
        OperationHandler %The function handler for the operation
        Prefix %The prefix for the text representation
        Suffix %The suffix for the text representation
    end
    
    methods
        function this = UnaryOperation(priority, operand,...
                operationHandler, prefix, suffix)
            this@Operation(priority);
            
            this.Children = operand;
            this.OperationHandler = operationHandler;
            this.Prefix = prefix;
            this.Suffix = suffix;
        end
        
        function value = calculate(this)
            value = this.OperationHandler(this.Children(1).calculate());
        end
        
        %Converts the operations to text in the following format:
        % Prefix Result Suffix
        %
        % Eg.: Transpose on a vector would result in: [1 2 3].'
        % Prefix  Result   Suffix
        %         [1 2 3]    .'
        function value = stringify(this)
            operand = this.Children(1).stringify;
            if isa(this.Children(1), 'Operation') && this.Priority < this.Children(1).Priority
                operand = ['(', operand, ')'];
            end
            
            value = [this.Prefix, operand, this.Suffix];
        end
    end
end

