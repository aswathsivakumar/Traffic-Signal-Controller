🚦 FPGA Based Traffic Signal Controller

Verilog HDL Implementation using Digilent Nexys A7

📌 Project Overview

This project implements an automated two-way traffic signal controller using Verilog HDL and an Artix-7 FPGA. The design controls North-South and East-West traffic using a Finite State Machine (FSM).

🎯 Objectives

- Design an automated traffic signal controller.
- Implement an FSM using Verilog HDL.
- Generate accurate traffic timing using a clock divider.
- Implement the design on the Nexys A7 FPGA board.
- Support emergency override functionality.

⚙️ Hardware Requirements

- Digilent Nexys A7 FPGA board
- USB programming cable
- Computer

💻 Software Requirements

- Xilinx Vivado Design Suite
- Verilog HDL

🚦 Traffic Signal Sequence

Traffic State| Duration
North-South Green| 5 seconds
North-South Yellow| 2 seconds
East-West Green| 5 seconds
East-West Yellow| 2 seconds
Both Red| 1 second

🔧 Main Features

- 100 MHz onboard clock
- Clock divider
- Finite State Machine
- Six traffic signal outputs
- Emergency override
- Automatic traffic sequence

📂 Project Files

- "traffic_signal_controller.v" – Verilog source code
- "Nexys_A7.xdc" – FPGA pin configuration
- "README.md" – Project documentation

🔄 Implementation Flow

1. RTL Design
2. Functional Simulation
3. Synthesis
4. Implementation
5. Bitstream Generation
6. FPGA Programming

🛠 FPGA Platform

Digilent Nexys A7 – Artix-7 FPGA

👨‍🎓 Project Author

Dhivahar B

B.Tech Electronics and Communication Engineering

📚 Tools Used

- Verilog HDL
- Xilinx Vivado
- Nexys A7 FPGA Development Board
