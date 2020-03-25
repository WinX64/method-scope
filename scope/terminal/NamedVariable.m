classdef NamedVariable < Node
    %NAMEDVARIABLE A named variable
    %   Similar to the Variable class, but can contain a custom
    %   representation name

    properties
        Children = [] %
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

