classdef Operation < Node
    %OPERATION An intermediary operation
    %   Base class for arithmetic, logical and other types of operations
    
    properties (SetAccess = private, GetAccess = protected)
        Priority %The priority of this operation, used to determine when to
                 %bracket node children values
    end
    
    methods
        function this = Operation(priority)
            this.Priority = priority;
        end
    end
end

