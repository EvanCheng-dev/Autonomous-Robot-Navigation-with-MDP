function [V, policy] = ValueIteration(gridSize, rewardGrid, terminalState, forbiddenStates, gamma, threshold)
    % Initialize the value function and policy
    V = zeros(gridSize);
    policy = zeros(gridSize);
    
    % Set up the state space
    states = setdiff(1:prod(gridSize), forbiddenStates);
    
    % Define transition probabilities
    transitionProbability = @(s, a, s_next) TransitionProbability(s, a, s_next, gridSize, forbiddenStates);
    
    % Value iteration main loop
    while true
        V_prev = V;
        delta = 0;
        for s = states
            [i, j] = ind2sub(gridSize, s); % Convert linear index to subscript
            if ismember(s, terminalState)
                continue; % Skip update if it's a terminal state
            end
            
            v = V(i, j);
            valueTemp = zeros(1, 4); % Temporary array for the values of four actions
            for a = 1:4 % Iterate over four actions
                valueTemp(a) = ActionValue(i, j, a, V_prev, rewardGrid, transitionProbability, gamma, forbiddenStates);
            end
            
            V(i, j) = max(valueTemp); % Update the state value
            [~, bestAction] = max(valueTemp);
            policy(i, j) = bestAction; % Update the policy
            delta = max(delta, abs(v - V(i, j)));
        end
        
        if delta < threshold
            break; % Converged, stop iteration
        end
    end
end