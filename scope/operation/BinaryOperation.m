classdef (Abstract) BinaryOperation < Operation
    %BINARYOPERATION Binary operations
    %   Base class for operations with two value
    
    properties
        Children %The two children nodes of the operation
    end
    
    properties (Access = private)
        OperationHandler %The function handler for the operation
        Prefix %The prefix for the text representation
        Infix %The infix for the text representation
        Suffix %The suffix for the text representation
    end
    
    methods
        function this = BinaryOperation(priority, operandOne,...
                operandTwo, operationHandler, prefix, infix, suffix)
            this@Operation(priority);
            
            this.Children = [operandOne, operandTwo];
            this.OperationHandler = operationHandler;
            this.Prefix = prefix;
            this.Infix = infix;
            this.Suffix = suffix;
        end
        
        function value = calculate(this)
            value = this.OperationHandler(...
                this.Children(1).calculate(),...
                this.Children(2).calculate());
        end
        
        %Converts the operations to text in the following format:
        % Prefix ResultOne Infix ResultTwo Suffix
        %
        % Eg.: Sum of two numbers would result in: 3 + 5
        % Prefix ResultOne Infix ResultTwo Suffix
        %            3       +       5
        %
        % Eg.: Array indexing would result in: [1 2 3](3)
        % Prefix ResultOne Infix ResultTwo Suffix
        %         [1 2 3]    (       3        )
        function value = stringify(this)
            operandOne = this.Children(1).stringify();
            if isa(this.Children(1), 'Operation') && this.Priority < this.Children(1).Priority
                operandOne = ['(', operandOne, ')'];
            end
            
            operandTwo = this.Children(2).stringify();
            if isa(this.Children(2), 'Operation') && this.Priority < this.Children(2).Priority
                operandTwo = ['(', operandTwo, ')'];
            end
            
            value = [this.Prefix, operandOne, this.Infix, operandTwo, this.Suffix];
        end
    end
end

