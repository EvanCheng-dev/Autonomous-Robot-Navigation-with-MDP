function value = ActionValue(i, j, action, V, rewardGrid, transitionProbability, gamma, forbiddenStates)
    % Initialize the expected value
    value = 0;
    gridSize = size(V); % Size of the grid
    % Define the possible outcomes for each action
    actions = [-1, 0; 1, 0; 0, -1; 0, 1]; % Up, down, left, right
    % Calculate the expected value after transitioning for each possible action
    for idx = 1:4
        next_i = i + actions(idx, 1);
        next_j = j + actions(idx, 2);
        
        % Check if the next state is within the grid and not forbidden
        if next_i >= 1 && next_i <= gridSize(1) && next_j >= 1 && next_j <= gridSize(2) && ~ismember(sub2ind(gridSize, next_i, next_j), forbiddenStates)
            % Calculate the probability of transitioning to this next state with action a
            prob = transitionProbability(sub2ind(gridSize, i, j), action, sub2ind(gridSize, next_i, next_j));
            
            % Accumulate the value
            value = value + prob * (rewardGrid(next_i, next_j) + gamma * V(next_i, next_j));
        end
    end
end