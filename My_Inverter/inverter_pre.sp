* CMOS inverter - pre-layout simulation
VDD vdd 0 DC 1.8
VIN in 0 PULSE(0 1.8 1n 100p 5n 10n)

.model NM NMOS LEVEL=1 VTO=0.5 KP=120u
.model PM PMOS LEVEL=1 VTO=-0.5 KP=50u

M1 out in 0   0   NM W=1u L=0.18u
M2 out in vdd vdd PM W=2u L=0.18u

CLOAD out 0 10f

.tran 50p 30n
.control 
run
plot v(in) v(out)
.endc
.end

