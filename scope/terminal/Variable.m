classdef Variable < Node
    %CONSTANT Summary of this class goes here
    %   Detailed explanation goes here

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

