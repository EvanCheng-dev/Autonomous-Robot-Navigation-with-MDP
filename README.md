# Autonomous-Robot-Navigation-with-MDP
ECE 9156 Project
Autonomous Robot Navigation with MDP

This project explores the application of Markov Decision Processes (MDPs) in autonomous robot navigation within a grid-based environment. The objective is to develop a navigation strategy that enables a robot to reach a designated goal efficiently while avoiding obstacles.

Introduction

Autonomous navigation is a critical aspect of robotics, enabling robots to operate without human intervention. By formulating the navigation problem as an MDP, we can leverage established decision-making frameworks to optimize the robot’s path in uncertain environments. ￼

MDP Framework

An MDP is defined by:
	•	States (S): Possible positions of the robot in the grid.
	•	Actions (A): Movements the robot can make (e.g., up, down, left, right).
	•	Transition Probabilities (T): The likelihood of moving from one state to another, considering potential uncertainties like slippage.
	•	Rewards (R): Incentives or penalties assigned to specific actions or states to guide the robot towards the goal while avoiding obstacles. ￼

This framework allows the robot to make decisions that maximize cumulative rewards over time, effectively balancing exploration and exploitation.

Implementation Details

The project is implemented in MATLAB and includes the following components:
	•	TransitionProbability.m: Defines the state transition probabilities based on the robot’s possible actions and environmental factors.
	•	ActionValue.m: Calculates the expected utility of actions in given states, guiding the robot’s decision-making process.
	•	ValueIteration.m: Implements the value iteration algorithm to compute the optimal policy by iteratively updating the value of each state.
	•	Main.m: The main script that initializes the environment, runs the value iteration algorithm, and simulates the robot’s navigation based on the derived policy.

Usage Instructions
	1.	Clone the Repository:

git clone https://github.com/EvanCheng-dev/Autonomous-Robot-Navigation-with-MDP.git


	2.	Navigate to the Project Directory:

cd Autonomous-Robot-Navigation-with-MDP


	3.	Run the Main Script in MATLAB:
Open Main.m in MATLAB and execute it to observe the robot’s navigation behavior based on the MDP framework.

Results

The simulation demonstrates the robot’s ability to navigate from a starting position to the goal while effectively avoiding obstacles. The MDP-based approach ensures that the robot makes optimal decisions even in the presence of uncertainties. ￼

License

This project is licensed under the MIT License. See the LICENSE file for details.