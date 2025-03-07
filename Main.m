% Main program Main.m

% Define the grid size, e.g., a 5x5 grid
gridSize = [5, 5];

% Define the reward for each cell
rewardGrid = [ -4, -3,  0,  0,  0;
               -2, -1,  0, -1, -1;
               -5, -2, -2, -2,  0;
               20,  0, -1, -5,  0;
               -3, -1, -2, -3,  0];

% Set the location of the terminal state
terminalState = sub2ind(gridSize, 4, 1);

% Set the location of forbidden states
forbiddenStates = sub2ind(gridSize, [1, 3; 1, 4; 2, 3; 3, 2; 3, 5; 4, 2; 4, 4; 5, 2; 5, 3]);

% Discount factor gamma
gamma = 0.9;

% Convergence threshold
threshold = 0.01;

% Call the value iteration function
[V, policy] = ValueIteration(gridSize, rewardGrid, terminalState, forbiddenStates, gamma, threshold);

% Display the final value function and policy
disp('Final value function V:');
disp(V);

disp('Final policy:');
disp(policy);

% Set the values of forbidden states to NaN for clear differentiation in the heatmap
V_heatmap = V;
V_heatmap(V_heatmap == 0) = NaN;  % Assuming 0 is the value of forbidden states

% Create a heatmap
figure;
h = heatmap(V_heatmap);

% Set properties of the heatmap
h.Title = 'Value Function Heatmap';
h.Colormap = parula;  % Using the parula color map
h.ColorScaling = 'scaledrows';  % Scale colors by row

% Disable cell labels for a cleaner heatmap
h.XDisplayLabels = repmat({''}, size(V_heatmap, 1), 1);
h.YDisplayLabels = repmat({''}, size(V_heatmap, 2), 1);

% Make forbidden states more apparent in the heatmap
h.MissingDataColor = [0.8, 0.8, 0.8];  % Set a gray color
h.ColorbarVisible = 'on';  % Turn on the color bar

% Display the heatmap
h