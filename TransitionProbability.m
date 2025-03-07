function prob = TransitionProbability(s, a, s_next, gridSize, forbiddenStates)
    % Parse the linear index into subscripts
    [i, j] = ind2sub(gridSize, s);
    [i_next, j_next] = ind2sub(gridSize, s_next);
    
    % Define all possible action outcomes
    actions = [-1, 0; 1, 0; 0, -1; 0, 1]; % Up, down, left, right
    prob = 0; % Initialize probability
    
    % Calculate the expected next state based on action a
    expected_next_i = i + actions(a, 1);
    expected_next_j = j + actions(a, 2);
    
    % If action a is performed, the robot moves to the expected position
    if expected_next_i == i_next && expected_next_j == j_next
        prob = 0.85; % The probability of transitioning to the main action
    else
        % Check if other actions would lead the robot to s_next
        other_actions = setdiff(1:4, a);
        for idx = other_actions
            next_i = i + actions(idx, 1);
            next_j = j + actions(idx, 2);
            if next_i == i_next && next_j == j_next
                % If another action leads to s_next, distribute the remaining probability among other actions
                prob = 0.15 / length(other_actions);
                break;
            end
        end
    end
    
    % Check if s_next is a forbidden state
    if ismember(s_next, forbiddenStates)
        prob = 0; % The transition probability to a forbidden state is 0
    end
    
    % Check for out-of-bounds
    if i_next < 1 || i_next > gridSize(1) || j_next < 1 || j_next > gridSize(2)
        prob = 0; % The transition probability for going out-of-bounds is 0
    end
end