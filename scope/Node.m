classdef (Abstract) Node < matlab.mixin.Heterogeneous
    %NODE A generic node
    %   Base class for all operations and terminals
    
    properties (Abstract)
        Children %Children of this node
    end
    
    methods (Abstract)
        calculate(this) %Calculates the value represented by this node
        stringify(this) %Generates a text representation of this node
    end
    
    methods
        %Extract the terminal of the tree, considering this node as the
        %root
        function terminals = extractTerminals(this)
            terminals = [];
            
            % Cycle through all children of this node
            for node = this.Children
                if ~isempty(node.Children)
                    %If it has children, then it's an intermediary
                    %Perform the same action on its children
                    terminals = cat(2, terminals, node.extractTerminals());
                else
                    %Otherwise, it's a terminal
                    %Add it to the list
                    terminals = cat(2, terminals, node);
                end
            end
        end
    end
end

