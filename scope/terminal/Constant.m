classdef Constant < Node
    %CONSTANT A constant value
    %   Representation of a constant numerical, logical, or other type of
    %   value
    
    properties
        Children = [] %Constants have no children
        Value %The value itself
    end
    
    methods
        function this = Constant(value)
            this.Value = value;
        end
        
        function value = calculate(this)
            value = this.Value;
        end
        
        %Representation for cell arrays or higher dimensional arrays is
        %still not supported
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

