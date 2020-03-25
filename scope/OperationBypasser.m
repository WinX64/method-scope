classdef OperationBypasser < handle
    %INDEXINGBYPASSER Bypasses operation logging
    %   Handle class that determines the behavior of operations in
    %   MethodScope instances
    
    properties
        Indexing = false %Determines the behavior for indexing operations
        Other = false %Determines the behavior for the remaining operations
    end
end

