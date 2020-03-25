classdef NamedVariable < Node
    %NAMEDVARIABLE Summary of this class goes here
    %   Detailed explanation goes here

    properties
        Children
        Name
        Value
    end
    
    methods
        function this = NamedVariable(name, value)
            this.Name = name;
            this.Value = value;
        end
        
        function value = calculate(this)
            value = this.Value;
        end
        
        function value = stringify(this)
            value = this.Name;
        end
    end
end

