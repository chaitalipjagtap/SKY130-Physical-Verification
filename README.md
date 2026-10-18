# SKY130 Physical Verification Project

## Project Overview

This project documents my hands-on learning and implementation work related to CMOS design, circuit simulation, and the open-source EDA workflow.

## Current Implementation

### CMOS Inverter — Pre-layout Simulation

- Created an inverter schematic using Xschem.
- Prepared a SPICE netlist using generic NMOS and PMOS Level-1 transistor models.
- Simulated the circuit using ngspice.
- Saved the simulation output in `My_Inverter/results/simulation.log`.

### Files

- `My_Inverter/inverter.sch` — Xschem inverter schematic.
- `My_Inverter/inverter_pre.sp` — SPICE input file for the generic CMOS inverter.
- `My_Inverter/results/simulation.log` — Batch simulation log.

## Simulation Results

The ngspice transient analysis completed and generated 621 data rows. The initial operating point showed an input of 0 V and an output of 1.8 V.

**Note:** This simulation uses generic transistor models. It is not a SKY130 process-specific simulation.

## Tools Used

- Xschem — schematic capture
- ngspice — circuit simulation
- Magic — layout exploration (SKY130 technology loading remains unresolved)

## Current Limitations

The SKY130A technology did not load successfully in the installed Magic environment. Therefore, this repository does not claim a verified SKY130 layout, DRC pass, or LVS pass.

## Project Status

This repository contains the original inverter files and simulation evidence listed above. Additional physical-design and verification work remains incomplete.
