v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 260 -150 260 -50 {lab=VIN}
N 300 -120 300 -80 {lab=VOUT}
N 300 -150 350 -150 {lab=#net1}
N 350 -180 350 -150 {lab=#net1}
N 300 -180 350 -180 {lab=#net1}
N 300 -50 350 -50 {lab=#net2}
N 350 -50 350 -20 {lab=#net2}
N 300 -20 350 -20 {lab=#net2}
C {sky130_fd_pr/pfet_01v8.sym} 280 -150 0 0 {name=M1 W=2 L=0.15 nf=1 mult=1 model=pfet_01v8}
C {sky130_fd_pr/nfet_01v8.sym} 280 -50 0 0 {name=M2 W=1 L=0.15 nf=1 mult=1 model=nfet_01v8}
C {lab_pin.sym} 260 -150 0 0 {name=p1 lab=VIN}
C {lab_pin.sym} 300 -100 0 0 {name=p2 lab=VOUT}
C {lab_pin.sym} 300 -180 0 0 {name=p3 lab=VDD}
C {lab_pin.sym} 300 -20 0 0 {name=p4 lab=VSS}
