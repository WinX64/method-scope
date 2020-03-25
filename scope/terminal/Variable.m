classdef Variable < Node
    %VARIABLE A variable value
    %   This class represents the values passed as argument for the method
    %   to be scoped

    properties
        Children = [] %Terminal nodes have no children
        Value %The value itself
        Name = '@'  %The name of the variable for representation
    end
    
    methods
        function this = Variable(value, name)
            this.Value = value;
            if nargin > 1
                this.Name = name;
            end
        end
        
        function value = calculate(this)
            value = this.Value;
        end
        
        function value = stringify(this)
            value = this.Name;
        end
    end
end

