classdef Constant < Node
    %CONSTANT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Children = []
        Value
    end
    
    methods
        function this = Constant(value)
            this.Value = value;
        end
        
        function value = calculate(this)
            value = this.Value;
        end
        
        function value = stringify(this)
            if iscell(this.Value)
                error('Cell display not supported!');
            end
            
            sizes = size(this.Value);
            if numel(sizes) > 2
                error('3-D display and higher order values not supported!');
            end
            
            value = mat2str(this.Value);
        end
    end
end

