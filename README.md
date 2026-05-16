# 🚀 Out-of-Order RISC-V CPU Pipeline (SystemVerilog | FPGA | VLSI)

![License](https://img.shields.io/badge/license-MIT-blue)
![Language](https://img.shields.io/badge/SystemVerilog-RTL-orange)
![Simulation](https://img.shields.io/badge/Simulation-ModelSim-green)
![Synthesis](https://img.shields.io/badge/Synthesis-Quartus-blueviolet)
![Status](https://img.shields.io/badge/Status-Active-success)

---

# 📑 Table of Contents

* Introduction
* Features
* CPU Architecture
* Pipeline Overview
* Technologies
* Mathematical Concepts
* Project Flow
* Simulation Flow
* FPGA Synthesis Flow
* Timing Analysis
* Waveform Verification
* Project Structure
* Results
* Future Enhancements
* Conclusion

---

# 📖 Introduction

The **Out-of-Order RISC-V CPU Pipeline** is a SystemVerilog RTL project implementing a simplified superscalar-inspired Out-of-Order execution pipeline architecture.

This project demonstrates key CPU microarchitecture concepts including:

* Instruction Fetch
* Program Counter Logic
* Decode Stage
* Pipeline Registers
* Reservation Station (RS)
* Reorder Buffer (ROB)
* ALU Execution
* Register Writeback
* FPGA Timing Closure

The design also demonstrates a complete FPGA/VLSI front-end workflow:

✅ RTL Design
✅ Functional Simulation
✅ Waveform Debugging
✅ FPGA Synthesis
✅ Timing Analysis
✅ Timing Constraint Verification

---

# ✨ Features

The CPU pipeline includes:

⚡ RISC-V Instruction Fetch Unit
🧠 Decoder Stage
🔁 Pipeline Register Propagation
📥 Reservation Station (RS)
📤 Reorder Buffer (ROB)
⚙️ ALU Execution Unit
🧩 Modular RTL Design
📡 Pipeline Valid Propagation
🧠 Register File Writeback
🛠️ Quartus FPGA Synthesis
📊 TimeQuest Timing Analysis
🔍 ModelSim Waveform Verification

---

# 🧠 CPU Architecture

## 🔷 High-Level Architecture

```text id="e21q4v"
                +-------------------+
                |   Program Counter |
                +---------+---------+
                          |
                          v
                +-------------------+
                |    Fetch Unit     |
                +---------+---------+
                          |
                          v
                +-------------------+
                |      Decoder      |
                +---------+---------+
                          |
                          v
                +-------------------+
                | Reservation Station|
                +---------+---------+
                          |
                          v
                +-------------------+
                |    Execute ALU    |
                +---------+---------+
                          |
                          v
                +-------------------+
                | Reorder Buffer    |
                +---------+---------+
                          |
                          v
                +-------------------+
                | Register File WB  |
                +-------------------+
```

---

# 🔄 Pipeline Overview

The processor pipeline is organized into four major stages:

| Stage   | Description                               |
| ------- | ----------------------------------------- |
| Fetch   | Fetch instruction from instruction memory |
| Decode  | Extract opcode and register fields        |
| Execute | ALU operation and execution               |
| Commit  | Writeback through ROB                     |

---

# 🔹 Fetch Stage

Responsible for:

* Program Counter update
* Instruction memory access
* Next PC generation
* Branch handling

### Key Modules

```text id="tlu7kq"
fetch_unit.sv
pc_logic.sv
next_pc_logic.sv
```

---

# 🔹 Decode Stage

Extracts instruction fields:

* opcode
* rd
* rs1
* rs2
* funct3
* funct7

### Key Module

```text id="zby79w"
decoder.sv
```

---

# 🔹 Reservation Station (RS)

Tracks:

* operand readiness
* dispatch logic
* issue tracking
* dependency management

### Key Module

```text id="l7t0uh"
reservation_station.sv
```

---

# 🔹 Reorder Buffer (ROB)

Supports:

* in-order commit
* out-of-order execution tracking
* writeback completion
* architectural state consistency

### Key Module

```text id="r3i5hk"
rob.sv
```

---

# 🔹 ALU Execution Unit

Current ALU supports:

* Arithmetic operations
* Pipeline execution flow
* Result propagation

### Future Support

* ADD
* SUB
* AND
* OR
* XOR
* SLT

---

# 🛠️ Technologies

| Tool                        | Usage                 |
| --------------------------- | --------------------- |
| SystemVerilog               | RTL Design            |
| ModelSim Intel FPGA Edition | Functional Simulation |
| Intel Quartus Prime         | FPGA Synthesis        |
| TimeQuest Analyzer          | Timing Analysis       |
| GitHub                      | Version Control       |

---

# 📐 Mathematical Concepts

## 🧠 1. Program Counter Increment

PC_{next}=PC_{current}+4

### Description

Each instruction is 32 bits (4 bytes), so PC increments by 4.

---

## 🧠 2. ALU Computation

Result=A+B

### Description

Arithmetic operations are executed inside the ALU stage.

---

## 🧠 3. Pipeline Propagation

```text id="h4ixz8"
Fetch → Decode → Execute → Commit
```

### Description

Instructions propagate sequentially across pipeline stages.

---

## 🧠 4. Timing Equation

Slack=Required\ Time-Arrival\ Time

### Description

Positive slack indicates successful timing closure.

---

# ⚙️ Project Flow

## 1️⃣ RTL Compilation (ModelSim)

```tcl id="7xqwwr"
vlog RTL/**/*.sv
vlog verification/tb/tb_top.sv
```

---

## 2️⃣ Start Simulation

```tcl id="6vpx6j"
vsim work.tb_top
```

---

## 3️⃣ Add Waveforms

```tcl id="n3hnhh"
add wave -r /*
```

---

## 4️⃣ Run Simulation

```tcl id="2lmkz9"
run 1us
```

---

# 📊 FPGA Synthesis Flow

## Quartus Steps

1. Create Quartus Project
2. Add RTL Files
3. Set Top-Level Entity:

```text id="67xv5q"
cpu_top
```

4. Add Timing Constraints:

```text id="jlwmul"
constraints.sdc
```

5. Start Compilation

---

# ⏱️ Timing Constraints

Example SDC Constraint:

```tcl id="sg5m1f"
create_clock -period 10.000 -name clk [get_ports {clk}]
```

### Clock Frequency

```text id="cgxxkc"
100 MHz
```

---

# 🔍 Waveform Verification

Waveforms verify:

✅ Program Counter Increment
✅ Instruction Fetch
✅ Decoder Outputs
✅ Pipeline Register Transfer
✅ ALU Execution
✅ Pipeline Valid Signals
✅ ROB Propagation

---

# 📁 Project Structure

```text id="3hqmn5"
Out_Of_Order_CPU_Pipeline_Design/
│
├── RTL/
│   ├── common/
│   │   ├── defines.svh
│   │   ├── macros.svh
│   │   ├── parameters_pkg.sv
│   │   ├── typedefs_pkg.sv
│   │   └── enums_pkg.sv
│   │
│   ├── fetch/
│   │   ├── fetch_unit.sv
│   │   ├── pc_logic.sv
│   │   └── next_pc_logic.sv
│   │
│   ├── decode/
│   │   └── decoder.sv
│   │
│   ├── reservation_station/
│   │   └── reservation_station.sv
│   │
│   ├── rob/
│   │   ├── rob.sv
│   │   └── rob_commit_logic.sv
│   │
│   └── top/
│       └── cpu_top.sv
│
├── verification/
│   └── tb/
│       └── tb_top.sv
│
├── constraints/
│   └── constraints.sdc
│
├── program.hex
│
├── docs/
│   ├── waveform.png
│   ├── rtl_view.png
│   ├── synthesis.png
│   └── timing.png
│
└── README.md
```

---

# 📈 Results

✅ Functional Simulation Successful
✅ ModelSim Waveforms Verified
✅ Fetch Unit Working
✅ Decoder Working
✅ Pipeline Registers Working
✅ ALU Execution Verified
✅ ROB Integration Verified
✅ Quartus Compilation Successful
✅ Timing Constraints Added
✅ FPGA Timing Analysis Verified

---

# 🚀 Future Enhancements

Planned upgrades include:

* Branch Prediction Unit
* Register Renaming
* Load Store Queue (LSQ)
* Cache Hierarchy
* AXI Bus Interface
* Superscalar Dispatch
* Multi-Issue Pipeline
* Hazard Detection Unit
* Branch Recovery Mechanism
* RISC-V ISA Expansion

---

# ⭐ Conclusion

This project demonstrates a complete Out-of-Order RISC-V CPU RTL design flow using SystemVerilog and FPGA synthesis tools.

The design provides practical experience in:

* CPU Microarchitecture
* RTL Design
* FPGA Verification
* Pipeline Debugging
* Timing Analysis
* Hardware Design Flow


