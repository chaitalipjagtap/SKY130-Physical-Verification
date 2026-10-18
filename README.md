# SKY130 Physical Verification Project

## 1. Project Overview

This project explores CMOS circuit design, schematic capture, pre-layout circuit simulation, and the physical verification workflow using open-source Electronic Design Automation (EDA) tools and the SKY130 Process Design Kit (PDK).

The project includes a generic CMOS inverter simulation and theoretical documentation of the SKY130 technology and physical verification process.

## 2. SKY130 Process Design Kit (PDK)

The SKY130 PDK provides technology-specific information required to design and verify integrated circuits using a nominal 130 nm CMOS process.

It includes:
- Technology and process-layer definitions.
- NMOS and PMOS device information.
- Design rules and layout constraints.
- Standard-cell libraries and related technology data.
- Files for supported EDA tools, including Magic and circuit simulation tools.

The PDK connects the circuit design to the manufacturing process by defining how devices and physical layers should be represented and checked.

**Important:** The generic transistor simulation in this repository is not a SKY130 model-based simulation.

## 3. Basic CMOS Process Layers

Common layers encountered in a CMOS process include:

- **N-well:** Region used to form PMOS devices in a typical bulk CMOS process.
- **Active/Diffusion:** Region where transistor source and drain structures are formed.
- **Polysilicon:** Commonly used to form the transistor gate.
- **Metal layers:** Conductive layers used for circuit interconnections.
- **Contacts and vias:** Structures that connect diffusion, polysilicon, and different metal layers.
- **Implant layers:** Define doped semiconductor regions.
- **Well and substrate taps:** Provide electrical connections to wells and substrate regions.

The exact layer names, purposes, and permitted geometries depend on the technology and PDK definitions.

## 4. NMOS and PMOS Transistors

A MOSFET is a voltage-controlled semiconductor device with four terminals: gate, source, drain, and body.

### NMOS

An NMOS transistor turns on when its gate-to-source voltage exceeds its threshold voltage sufficiently. It can provide a conducting path between the drain and source.

In a basic CMOS inverter, the NMOS connects the output toward ground when the input is HIGH.

### PMOS

A PMOS transistor turns on when its gate-to-source voltage is sufficiently negative, or equivalently when its source-to-gate voltage exceeds the magnitude of its threshold voltage.

In a basic CMOS inverter, the PMOS connects the output toward the positive supply when the input is LOW.

## 5. CMOS Inverter Operation

A CMOS inverter uses one PMOS transistor and one NMOS transistor. Their gates are connected to the input, and their drains are connected to the output. The PMOS source connects to the positive supply, while the NMOS source connects to ground.

| Input | PMOS | NMOS | Expected output |
|---|---|---|---|
| LOW (0 V) | ON | OFF | HIGH (approximately VDD) |
| HIGH (approximately VDD) | OFF | ON | LOW (approximately 0 V) |

The inverter performs the Boolean operation:

**Y = NOT(A)**

Ideally, steady-state CMOS logic consumes very little static power, although real circuits have leakage and dynamic switching power.

## 6. Open-Source EDA Workflow

The general workflow for a simple CMOS circuit is:

1. **Xschem:** Draw the transistor-level schematic and connect circuit terminals.
2. **SPICE netlist:** Represent circuit elements and their electrical connections in a text-based format.
3. **ngspice:** Run DC, AC, or transient simulations using suitable device models.
4. **Magic:** Create and inspect the physical layout using the appropriate technology file.
5. **DRC:** Check the layout against the process design rules.
6. **LVS:** Compare the extracted layout connectivity against the reference schematic netlist.
7. **Parasitic extraction:** Estimate parasitic resistance and capacitance from the layout for further simulation.

A successful schematic simulation does not by itself prove that a layout satisfies design rules or matches the schematic.

## 7. Physical Verification

### Design Rule Check (DRC)

DRC checks whether layout geometry satisfies technology-specific manufacturing constraints, such as minimum width, spacing, enclosure, and overlap requirements.

A clean DRC report indicates that the checked layout passed the rules included in that run. It does not guarantee that a circuit is functionally correct.

### Layout Versus Schematic (LVS)

LVS extracts a circuit representation from the physical layout and compares it with the reference schematic. It checks device types, connectivity, and other supported comparison properties.

A successful LVS result indicates that the compared layout and schematic are consistent according to the configured rules.

### Why Both Are Needed

DRC checks physical geometry; LVS checks electrical correspondence. A layout may pass DRC but fail LVS if its circuit connections are incorrect.

## 8. Implemented CMOS Inverter Simulation

The repository contains an Xschem schematic and a separate SPICE netlist for a generic CMOS inverter.

Simulation setup:
- Supply voltage: 1.8 V
- NMOS model: Generic Level-1 model
- PMOS model: Generic Level-1 model
- NMOS dimensions: W = 1 µm, L = 0.18 µm
- PMOS dimensions: W = 2 µm, L = 0.18 µm
- Output load: 10 fF
- Transient stop time: 30 ns
- Maximum requested time step: 50 ps

The input pulse is configured to transition between 0 V and 1.8 V. The ngspice batch simulation completed and generated 650 transient data rows.

The initial operating point showed an input near 0 V and an output near 1.8 V, consistent with the expected inverter state for a LOW input.

**Limitation:** These results use generic Level-1 transistor models. They do not establish SKY130-specific electrical performance. The generated waveform data is available in `My_Inverter/results/inverter_waveform.csv`.

## 9. Project Files

- `My_Inverter/inverter.sch` — Xschem schematic source.
- `My_Inverter/inverter_pre.sp` — Generic SPICE netlist.
- `My_Inverter/results/simulation.log` — Latest ngspice batch log.
- `My_Inverter/results/inverter_waveform.csv` — Saved transient waveform data.

## 10. Tools

- **Xschem:** Schematic capture.
- **ngspice:** Circuit simulation.
- **Magic:** Layout creation and inspection.
- **Netgen:** Commonly used for netlist comparison and LVS workflows.
- **SKY130 PDK:** Technology definitions, device information, and design rules.

## 11. Current Status and Limitations

The generic CMOS inverter transient simulation completed, and waveform data was saved.

The SKY130A technology did not load successfully in the available Magic environment because of a tool-version compatibility problem. Therefore, this repository does not claim a verified SKY130 layout, a passing SKY130 DRC result, or a passing LVS result.

The project documents the implemented simulation and the theory behind the physical verification workflow. Completing the technology-specific layout, DRC, and LVS steps remains future work.

## 12. Conclusion

This project demonstrates the basic CMOS inverter concept, schematic and SPICE file organization, and a generic pre-layout transient simulation using open-source EDA tools. It also documents the role of the SKY130 PDK, process layers, and physical verification checks. Further work is required to complete and verify a technology-specific SKY130 layout.
