classdef OperationPresenter
    %OPERATIONPRESENTER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (SetAccess = private)
        OperationTrees
        NamedOperationTrees
        UniqueVariables
    end
    
    methods
        function this = OperationPresenter(operationTrees)
            if ~isvector(operationTrees)
                error('operationTrees must be a vector');
            end
            if size(operationTrees, 1) ~= 1
                operationTrees = operationTrees';
            end
            
            this.OperationTrees = operationTrees;
            this = this.initialize();
        end
    end
    
    methods
        function present(this)
            fprintf('=== Inputs ===\n');
            for variable = this.UniqueVariables
                fprintf(' %s = %s\n', variable.Name, Constant(variable.Value).stringify());
            end
            
            variables = strjoin(arrayfun(@(x) string(x.Name), this.UniqueVariables), ', ');
            fprintf('=== Outputs ===\n');
            for i = 1:numel(this.NamedOperationTrees)
                namedOperationTree = this.NamedOperationTrees(i);
                fprintf(' f%d(%s) = %f = %s\n', i, variables,...
                    namedOperationTree.calculate(), namedOperationTree.stringify());
            end
        end
    end
    
    methods (Access = private)
        function this = initialize(this)
            %Array of terminal variables in all trees
            variables = [];
            
            for operationTree = this.OperationTrees
                %Extract the terminal nodes
                terminalNodes = operationTree.extractTerminals();

                %Filter out contants and other nodes
                for node = terminalNodes
                    if isa(node, 'Variable')
                        variables = cat(2, variables, node);
                    end
                end
            end
            
            %Filter unique variables
            uniqueVariables = [];
            for variable = variables
                if ~any(arrayfun(@(x) isequal(x, variable), uniqueVariables))
                    uniqueVariables = cat(2, uniqueVariables, variable);
                end
            end

            %Create named variable mapping
            currentVariableName = 65; %ASCII code
            mapping = [];
            for variable = uniqueVariables
                mapping = cat(1, mapping, Variable(variable.Value, char(currentVariableName)));
                currentVariableName = currentVariableName + 1;
            end

            %Map the existing operation tree
            namedOperationTrees = [];
            for operationTree = this.OperationTrees
                namedOperationTrees = cat(2, namedOperationTrees,...
                    OperationPresenter.insertNamedVariables(operationTree, mapping));
            end

            %Update properties
            this.UniqueVariables = mapping';
            this.NamedOperationTrees = namedOperationTrees;
        end
    end
    
    methods (Static, Access = public)
        function tree = insertNamedVariables(tree, mapping)
            for i = 1:numel(tree.Children)
                node = tree.Children(i);
                if isempty(node.Children)
                    if ~isa(node, 'Variable')
                        continue;
                    end
                    
                    for j = 1:size(mapping, 1)
                        if isequal(node.Value, mapping(j).Value)
                            break;
                        end
                    end
                    
                    tree.Children(i) = mapping(j);
                else
                    tree.Children(i) = OperationPresenter.insertNamedVariables(node, mapping);
                end
            end
        end
    end
end

