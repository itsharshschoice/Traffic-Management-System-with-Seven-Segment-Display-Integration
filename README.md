
# **Traffic Management System with Seven-Segment Display Integration**

This repository contains the Verilog implementation of a Traffic Light Controller designed for managing traffic at an intersection involving a highway and a city road. The controller operates using a finite state machine (FSM) and controls the lights for four directions: Highway North, Highway South, City East, and City West. The traffic light statuses are displayed on seven-segment displays, with each state transition based on a defined timing mechanism.


## **Features**

- **Finite State Machine (FSM)** : The controller is implemented using an FSM with eight distinct states to manage traffic efficiently.

- **Seven-Segment Display Integration** : Traffic light statuses (Red, Yellow, Green) are represented as characters ('R', 'Y', 'G') on seven-segment displays.

- **Configurable Timings** : The delay for Green-to-Yellow and Yellow-to-Red transitions can be adjusted as per requirements.

- **Scalable Design** : The controller can be extended to support additional roads or customized state transitions
## **State Design**

### Traffic Light States

Each state represents the light configuration for the four directions:

| State | Highway North | City East | Highway South | City West |
|-------|----------------|-----------|---------------|-----------|
| S0    | Green          | Red       | Red           | Red       |
| S1    | Yellow         | Red       | Red           | Red       |
| S2    | Red            | Green     | Red           | Red       |
| S3    | Red            | Yellow    | Red           | Red       |
| S4    | Red            | Red       | Green         | Red       |
| S5    | Red            | Red       | Yellow        | Red       |
| S6    | Red            | Red       | Red           | Green     |
| S7    | Red            | Red       | Red           | Yellow    |


## **State Machine View**

The FSM consists of eight states (S0 to S7), each representing a specific configuration for the traffic lights at the four intersections. Below is a simplified state machine view:

![App Screenshot](https://github.com/itsharshschoice/Traffic-Management-System-with-Seven-Segment-Display-Integration/blob/main/Screenshots/FSM.png?raw=true)
## **Input/Output Description**

**Inputs**

- `clk` (Clock): Synchronizes the state transitions.
- `rst` (Reset): Resets the controller to its initial state (S0).

**Outputs**

- `HighwayN` (7 bits): Displays the light status for Highway North.
- `HighwayS` (7 bits): Displays the light status for Highway South.
- `CityE` (7 bits): Displays the light status for City East.
- `CityW` (7 bits): Displays the light status for City West.


## **Local Parameters**

**Traffic Light Display Codes**

- `RED` : 7'b1110111 (Displays 'R')
- `YELLOW` : 7'b0110011 (Displays 'Y')
- `GREEN` : 7'b1011111 (Displays 'G')

**State Timing**

- `GREEN_TO_YELLOW` : 2 clock cycles
- `YELLOW_TO_RED` : 1 clock cycle
## **FSM Implementation**

**State Transition Logic**

- The FSM transitions sequentially through states S0 to S7, completing a full cycle. Each state determines the current light configuration for all four directions and the duration before transitioning to the next state.

**Output Logic**

- The light status for each direction is updated based on the current state of the FSM. The appropriate code for Red, Yellow, or Green is assigned to the corresponding output.

**Counter Logic**

- A counter manages the delay between state transitions, ensuring that Green, Yellow, and Red lights are displayed for their designated durations.
## **RTL**

The RTL design for the traffic light controller is implemented using a Finite State Machine (FSM) to manage the transitions between various states (S0 to S7).

![App Screenshot](https://github.com/itsharshschoice/Traffic-Management-System-with-Seven-Segment-Display-Integration/blob/main/Screenshots/RTL.png?raw=true)

## **Simulation**

In the simulation, the FSM is tested by applying clock pulses and verifying the output of the traffic light controller for each state. The simulation ensures that the traffic lights follow the correct sequence and timings as specified in the state table. During the simulation, the changes in the light configuration can be visualized, and the expected transitions from one state to the next are observed.

![App Screenshot](https://github.com/itsharshschoice/Traffic-Management-System-with-Seven-Segment-Display-Integration/blob/main/Screenshots/Simulation.png?raw=true)

## **Conclusion**

This project successfully demonstrates the implementation of a Traffic Light Controller using Verilog, featuring a robust FSM design and integration with seven-segment displays for intuitive status representation. With its modular architecture and configurable timings, the system is versatile and can be expanded to support more complex traffic management requirements.