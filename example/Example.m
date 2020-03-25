%% === MethodScope Usage Example ===
%Here we have a p-coded file, PM_dX_Peltier.p, used in the calculatation of
%the derivatives of a Peltier cell space-state model. It takes two
%arguments: i) A vector of three elements representing the three states of
%the system, ii) A scalar representing the input voltage, ranging from 0 to
%6.

%We can declare a state and input...
state = [10 20 30]';
input = 6;

%...and pass them to the function to get the derivatives
result = PM_dX_Peltier(state, input);
fprintf('The derivatives for the given input are: %s\n', mat2str(result));

%However, as the system is of black-box nature, we have no immediate way to
%know how these values were generated...

% == Enter MethodScope! ==

%We first declare a bypasser of operations to be used later...
bypasser = OperationBypasser();

%...and then two MethodScope instances with the same values as the state
%and input used previously
state = MethodScope(state, bypasser);
input = MethodScope(input, bypasser);

%Both arguments can be passed normally to the function, and will return
%instances of itself instead of numerical values
result = PM_dX_Peltier(state, input);

%Indexing bypassing is disabled in order to access the different values on
%the result vector
bypasser.Indexing = true;

%The operation trees are extracted from the MethodScope instances
trees = arrayfun(@(x) x.OperationTree, result);

%Finally, they're passed to a OperationPresenter for a better text
%representation
presenter = OperationPresenter(trees);
presenter.present();

%It is now possible to extract the three equations that govern the
%derivative update portion of the system, and how they relate to each of
%the input passed as argument!