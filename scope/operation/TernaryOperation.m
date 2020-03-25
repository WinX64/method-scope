classdef (Abstract) TernaryOperation < Operation
    %TERNARYOPERATION Ternary operations
    %   Base class for operations with three value
    
    properties
        Children %The three children nodes of the operation
    end
    
    properties (Access = private)
        OperationHandler %The function handler for the operation
        Prefix %The prefix for the text representation
        InfixOne %The first infix for the text representation
        InfixTwo %The second infix for the text representation
        Suffix %The suffix for the text representation
    end
    
    methods
        function this = TernaryOperation(priority, operandOne,...
                operandTwo, operandThree, operationHandler, prefix,...
                infixOne, infixTwo, suffix)
            this@Operation(priority);
            
            this.Children = [operandOne, operandTwo, operandThree];
            this.OperationHandler = operationHandler;
            this.Prefix = prefix;
            this.InfixOne = infixOne;
            this.InfixTwo = infixTwo;
            this.Suffix = suffix;
        end
        
        function value = calculate(this)
            value = this.OperationHandler(...
                this.Children(1).calculate(),...
                this.Children(2).calculate(),...
                this.Children(3).calculate());
        end
        
        %Converts the operations to text in the following format:
        % Prefix ResultOne InfixOne ResultTwo InfixTwo ResultThree Suffix
        %
        % Eg.: A sequence with increment of 2 would result in: 1:2:10
        % Prefix ResultOne InfixOne ResultTwo InfixTwo ResultThree Suffix
        %            1         :        2         :        10
        function value = stringify(this)
            operandOne = this.Children(1).stringify();
            if isa(this.Children(1), 'Operation') && this.Priority < this.Children(1).Priority
                operandOne = ['(', operandOne, ')'];
            end
            
            operandTwo = this.Children(2).stringify();
            if isa(this.Children(2), 'Operation') && this.Priority < this.Children(2).Priority
                operandTwo = ['(', operandTwo, ')'];
            end
            
            operandThree = this.Children(3).stringify();
            if isa(this.Children(3), 'Operation') && this.Priority < this.Children(3).Priority
                operandThree = ['(', operandThree, ')'];
            end
            
            value = [this.Prefix, operandOne, this.InfixOne, operandTwo,...
                this.InfixTwo, operandThree, this.Suffix];
        end
    end
end

