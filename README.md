# Automated Planning with PDDL

This project explores **symbolic AI and automated planning** using the Planning Domain Definition Language (PDDL).  
It demonstrates how intelligent agents can reason about actions, constraints, and goals to generate valid plans in structured environments.

Two classic planning domains are implemented to highlight different planning challenges and reasoning strategies.

---

## Project Overview

The project consists of **two independent PDDL planning domains**, each with a domain definition and a corresponding problem instance:

### 1. Gripper Domain
A robot agent operates in two rooms and uses two grippers to transport multiple objects.  
This domain focuses on:
- STRIPS-style action modelling
- Preconditions and effects
- Efficient action sequencing and resource usage

### 2. Wumpus World Domain
An agent navigates a hazardous grid-based environment containing pits and a Wumpus, with the objective of retrieving gold and safely returning to the start.  
This domain emphasises:
- Constraint-based reasoning
- Safety-aware planning
- Logical corrections and extended action constraints

---

## Project Structure

- Domain files (*_domain.pddl) define predicates, actions, and constraints.
- Problem files (*_problem.pddl) specify objects, initial states, and goal conditions.
- automated_planning.pdf contains a detailed technical report explaining the modelling decisions, planner behaviour, solver comparison, and results.

```text
├── gripper_domain.pddl
├── gripper_problem.pddl
├── wumpus_domain.pddl
├── wumpus_problem.pddl
└── automated_planning.pdf
