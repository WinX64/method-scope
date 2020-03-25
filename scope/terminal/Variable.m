classdef Variable < Node
    %VARIABLE A variable value
    %   This class represents the values passed as argument for the method
    %   to be scoped

    properties
        Children = []
        Value
    end
    
    methods
        function this = Variable(value)
            this.Value = value;
        end
        
        function value = calculate(this)
            value = this.Value;
        end
        
        function value = stringify(~)
            value = '@';
        end
    end
end

