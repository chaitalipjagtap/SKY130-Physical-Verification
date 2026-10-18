v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 70 -70 70 -50 {
lab=VOUT}
N 30 -100 30 -20 {
lab=VIN}
N 70 -60 130 -60 {
lab=VOUT}
N -10 -60 30 -60 {
lab=VIN}
N 130 -60 190 -60 {
lab=VOUT}
N 70 -200 70 -130 {
lab=#net1}
N 70 -200 100 -200 {
lab=#net1}
N 70 -100 160 -100 {
lab=#net1}
N 160 -200 160 -100 {
lab=#net1}
N 100 -200 160 -200 {
lab=#net1}
N 70 -20 70 10 {
lab=GND}
C {nmos4.sym} 50 -20 0 0 {name=M1 model=nmos w=1u l=0.18u del=0 m=1}
C {pmos4.sym} 50 -100 0 0 {name=M2 model=pmos w=2u l=0.18u del=0 m=1}
C {gnd.sym} 70 10 0 0 {name=l1 lab=GND}
C {vsource.sym} 100 -170 0 0 {name=V1 value=1.8 savecurrent=false}
C {lab_pin.sym} -10 -60 0 0 {name=p1 sig_type=std_logic lab=VIN}
C {lab_pin.sym} 190 -60 0 0 {name=p2 sig_type=std_logic lab=VOUT}
C {vsource.sym} -10 -30 0 0 {name=V2 value=PULSE(0 1.8 1n 100p 100p 5n 10n) savecurrent=false}
C {gnd.sym} -10 0 0 0 {name=l2 lab=GND}
C {gnd.sym} 100 -140 0 0 {name=l3 lab=GND}
