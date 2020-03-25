classdef MethodScope
%METHODSCOPE Scope methods for their arithmetic operations
% Logs all overridable operations performed upon this instance
% Operation overrides can be bypassed with the given OperationBypasser
% instance
    
    properties (SetAccess = private)
        Value %The value for the evaluated expression
        OperationTree %Tree of performed operation
        Bypasser %The operation bypasser
    end
    
    methods
        function this = MethodScope(value, bypasser)
            this.Value = value;
            this.OperationTree = Variable(value);
            this.Bypasser = bypasser;
        end
        
        % a' Oeprator
        function result = ctranspose(this)
            result = MethodScope.logUnaryOperation(this, @CTransposeOperation, 'ctranspose');
        end
        
        % a.' Operator
        function result = transpose(this)
            result = MethodScope.logUnaryOperation(this, @TransposeOperation, 'transpose');
        end
        
        % a.^b Operator
        function result = power(objOne, objTwo)
            result = MethodScope.logBinaryOperation(objOne, objTwo, @PowerOperation, 'power');
        end
        
        % a^b Operator
        function result = mpower(objOne, objTwo)
            result = MethodScope.logBinaryOperation(objOne, objTwo, @MPowerOperation, 'mpower');
        end
        
        % +a Operator
        function result = uplus(this)
            result = MethodScope.logUnaryOperation(this, @UPlusOperation, 'uplus');
        end
        
        % -a Operator
        function result = uminus(this)
            result = MethodScope.logUnaryOperation(this, @UMinusOperation, 'uminus');
        end
        
        % ~a Operator
        function result = not(this)
            result = MethodScope.logUnaryOperation(this, @NotOperation, 'not');
        end
        
        % a .* b Operator
        function result = times(objOne, objTwo)
            result = MethodScope.logBinaryOperation(objOne, objTwo, @TimesOperation, 'times');
        end
        
        % a ./ b Operator
        function result = rdivide(objOne, objTwo)
            result = MethodScope.logBinaryOperation(objOne, objTwo, @RDivideOperation, 'rdivide');
        end
        
        % a .\ b Operator
        function result = ldivide(objOne, objTwo)
            result = MethodScope.logBinaryOperation(objOne, objTwo, @LDivideOperation, 'ldivide');
        end
        
        % a * b Operator
        function result = mtimes(objOne, objTwo)
            result = MethodScope.logBinaryOperation(objOne, objTwo, @MTimesOperation, 'mtimes');
        end
        
        % a / b Operator
        function result = mrdivide(objOne, objTwo)
            result = MethodScope.logBinaryOperation(objOne, objTwo, @MRDivideOperation, 'mrdivide');
        end
        
        % a \ b Operator
        function result = mldivide(objOne, objTwo)
            result = MethodScope.logBinaryOperation(objOne, objTwo, @MLDivideOperation, 'mldivide');
        end
        
        % a + b Operator
        function result = plus(objOne, objTwo)
            result = MethodScope.logBinaryOperation(objOne, objTwo, @PlusOperation, 'plus');
        end
        
        % a - b Operator
        function result = minus(objOne, objTwo)
            result = MethodScope.logBinaryOperation(objOne, objTwo, @MinusOperation, 'minus');
        end
        
        % a:b:c Operator
        function result = colon(objOne, objTwo, objThree)
            if nargin == 2
                result = MethodScope.logBinaryOperation(objOne, objTwo, @Colon2Operation, 'colon');
            else
                result = MethodScope.logTernaryOperation(objOne, objTwo, objThree, @Colon3Operation, 'colon');
            end
        end
        
        % a < b Operator
        function result = lt(objOne, objTwo)
            result = MethodScope.logBinaryOperation(objOne, objTwo, @LTOperation, 'lt');
        end
        
        % a <= b Operator
        function result = le(objOne, objTwo)
            result = MethodScope.logBinaryOperation(objOne, objTwo, @LEOperation, 'le');
        end
        
        % a > b Operator
        function result = gt(objOne, objTwo)
            result = MethodScope.logBinaryOperation(objOne, objTwo, @GTOperation, 'gt');
        end
        
        % a >= b Operator
        function result = ge(objOne, objTwo)
            result = MethodScope.logBinaryOperation(objOne, objTwo, @GEOperation, 'ge');
        end
        
        % a == b Operator
        function result = eq(objOne, objTwo)
            result = MethodScope.logBinaryOperation(objOne, objTwo, @EQOperation, 'eq');
        end
        
        % a ~= b Operator
        function result = ne(objOne, objTwo)
            result = MethodScope.logBinaryOperation(objOne, objTwo, @NEOperation, 'ne');
        end
        
        % a & b Operator
        function result = and(objOne, objTwo)
            result = MethodScope.logBinaryOperation(objOne, objTwo, @AndOperation, 'and');
        end
        
        % a | b Operator
        function result = or(objOne, objTwo)
            result = MethodScope.logBinaryOperation(objOne, objTwo, @OrOperation, 'or');
        end
        
        % double() conversion method
        function result = double(this)
            result = double(this.Value);
        end
        
        % logical() conversion method
        function result = logical(this)
            result = logical(this.Value);
        end
        
        % Subscript reference, includes (), {} and . indexing
        function result = subsref(this, refs)
            firstRef.type = '()';
            firstRef.subs = {1};
            bypasser = builtin('subsref', this, firstRef).Bypasser;
            if bypasser.Indexing
                result = builtin('subsref', this, refs);
                return;
            end
            
            result = this;
            
            for i = 1:numel(refs)
                ref = refs(i);
                
                if strcmp(ref.type, '()')
                    if numel(ref.subs) > 1
                        error('Only single array indexing is supported!');
                    end
                    
                    result = MethodScope.logBinaryOperation(result, ref.subs{1}, @ArrayIndexingOperation);
                elseif strcmp(ref.type, '{}')
                    if numel(ref.subs) > 1
                        error('Only single cell indexing is supported!');
                    end
                    
                    result = MethodScope.logBinaryOperation(result, ref.subs{1}, @CellIndexingOperation);
                else
                    result = MethodScope.logBinaryOperation(result, ref.subs, @DotIndexingOperation);
                end
            end
        end
    end
    
    %Utility methods
    methods (Static, Access = private)
        %Logs a unary operation and returns a new MethodScope
        function result = logUnaryOperation(obj, constructor, method)
            bypasser = obj.Bypasser;
            if nargin > 2 && bypasser.Other
                result = builtin(method, obj);
                return;
            end
            
            operation = constructor(obj.OperationTree);
            result = MethodScope(operation.calculate(), bypasser);
            result.OperationTree = operation;
        end
        
        %Logs a binary operation and returns a new MethodScope
        function result = logBinaryOperation(objOne, objTwo, constructor, method)
            bypasser = MethodScope.extractBypasser(objOne, objTwo);
            if nargin > 3 && bypasser.Other
                result = builtin(method, objOne, objTwo);
                return;
            end
            
            operandOne = MethodScope.extractOperand(objOne);
            operandTwo = MethodScope.extractOperand(objTwo);
            
            operation = constructor(operandOne, operandTwo);
            result = MethodScope(operation.calculate(), bypasser);
            result.OperationTree = operation;
        end
        
        %Logs a ternary operation and returns a new MethodScope
        function result = logTernaryOperation(objOne, objTwo, objThree, constructor, method)
            bypasser = MethodScope.extractBypasser(objOne, objTwo, objThree);
            if nargin > 4 && bypasser.Other
                result = builtin(method, objOne, objTwo, objThree);
                return;
            end
            
            operandOne = MethodScope.extractOperand(objOne);
            operandTwo = MethodScope.extractOperand(objTwo);
            operandThree = MethodScope.extractOperand(objThree);
            
            operation = constructor(operandOne, operandTwo, operandThree);
            result = MethodScope(operation.calculate(), bypasser);
            result.OperationTree = operation;
        end
        
        %Extracts the correspondent Node from the given argument
        function operand = extractOperand(obj)
            if isa(obj, 'MethodScope')
                operand = obj.OperationTree;
            else
                operand = Constant(obj);
            end
        end
        
        %Extracts the bypasser from the first given MethodScope argument
        function bypasser = extractBypasser(varargin)
            scope = [];
            for i = 1:nargin
                if isa(varargin{i}, 'MethodScope')
                    scope = varargin{i};
                    break;
                end
            end
            
            if isempty(scope)
                error('Bypasser not found!');
            end
            
            bypasser = scope.Bypasser;
        end
    end
end

