# Autonomous-Robot-Navigation-with-MDP
ECE 9156 Project

## Introduction

Autonomous navigation is essential in robotics for enabling robots to operate without human intervention. By modeling the navigation problem as an MDP, the robot can make optimal decisions under uncertainty, maximizing cumulative rewards over time.
This project applies Markov Decision Processes (MDPs) to autonomous robot navigation within a grid-based environment. The goal is to compute an optimal policy for the robot to reach its destination while avoiding obstacles and handling uncertain movements.

## MDP Framework

The MDP in this project is defined as follows:
- **States (S)**: Robot positions on the grid.
- **Actions (A)**: Movements (up, down, left, right).
- **Transition Probabilities (T)**: Probabilistic outcomes of actions (e.g., the robot might slip into adjacent cells).
- **Rewards (R)**: Positive rewards for reaching the goal, negative rewards for obstacles and steps to encourage efficiency.

## Implementation Details

The project is implemented in MATLAB and includes the following key components:
- **TransitionProbability.m**: Defines the transition probability model for the robot’s movements.
- **ActionValue.m**: Computes the expected value of actions from each state.
- **ValueIteration.m**: Executes the Value Iteration algorithm to compute the optimal policy.
- **Main.m**: Initializes the environment, runs Value Iteration, and simulates the robot’s navigation based on the computed policy.

## Usage
1. Clone the repository: 'git clone <repository-url>'
2. Open the project in MATLAB and navigate to the project directory.
3. Run the main script: 'Main'

## Results

The simulation demonstrates the robot’s ability to navigate from a start position to the goal while effectively avoiding obstacles. Using the MDP framework and Value Iteration, the robot successfully handles uncertainties and finds an optimal path.

## License

This project is licensed under the MIT License.
